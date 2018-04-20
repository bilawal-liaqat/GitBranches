//
//  PhotoPicker.swift
//
//
//  Created by Asif Bilal on 23/05/2016.
//  Copyright © 2016 Asif Bilal. All rights reserved.
//

import UIKit

open class PhotoPicker: NSObject {
    
    public enum PickerSourceType: Int {
        case camera = 0,
        photoLibrary,
        cameraAndPhotoLibrary
    }
    
    
    var successBlock:((_ originalPhoto:UIImage?, _ editedPhoto: UIImage?) -> ())!
    
    open func pick(_ allowsEditing:Bool = false,
                   pickerSourceType: PickerSourceType = .photoLibrary,
                   controller: UIViewController,
                   successBlock success: @escaping ((_ originalPhoto:UIImage?, _ editedPhoto: UIImage?) -> ()))
    {
        
        if pickerSourceType == .cameraAndPhotoLibrary {
            
            let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
           
            
            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
                print("User pressed Cancel")
            }))
            //Camera/CameraCamera
            alertController.addAction(UIAlertAction(title: "Camera", style: .default, handler: { action in
                self.pick(allowsEditing, pickerSourceType: .camera, controller: controller, successBlock: success)
            }))
            
            alertController.addAction(UIAlertAction(title: "Camera Roll", style: .default, handler: { action in
                self.pick(allowsEditing, pickerSourceType: .photoLibrary, controller: controller, successBlock: success)
            }))
            
            controller.present(alertController, animated: true, completion: nil)
            
            return
            
        }
        
        //Now show the Image Picker Controller
        
        var sourceType:UIImagePickerControllerSourceType!
        
        switch pickerSourceType {
        case .camera:
            
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                sourceType = .camera
            } else {
                sourceType = .savedPhotosAlbum
            }
            
        case .photoLibrary:
            sourceType = .photoLibrary
        default:
            sourceType = .savedPhotosAlbum
            
        }
        
        let picker = UIImagePickerController()
        
        picker.sourceType = sourceType
        picker.allowsEditing = allowsEditing
        picker.delegate = self
        
        self.successBlock = success
        
        controller.present(picker, animated: true, completion: nil)
        
    }
    
}

extension PhotoPicker: UINavigationControllerDelegate {
    
}

extension PhotoPicker: UIImagePickerControllerDelegate {
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let originalPhoto = info[UIImagePickerControllerOriginalImage] as? UIImage
        let editedPhoto = info[UIImagePickerControllerEditedImage] as? UIImage
        
        successBlock(originalPhoto, editedPhoto)
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
}
