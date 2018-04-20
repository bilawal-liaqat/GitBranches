//
//  FacebookLogger.swift
//  HSK
//

//
/*
import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

class FacebookLogger: NSObject {
    
    fileprivate let cancelError = "You have cancelled Login."
    
    func facebookAuthenticcation(successBlock success: @escaping ((_ facebookToken:String) -> Void),
                                      failureBlock failure: @escaping ((_ error: NSError?) -> Void)) {
        
        if let currentAccessToken = FBSDKAccessToken.current() {
            success(currentAccessToken.tokenString)
            return
        }
        
        let fbLoginManager = FBSDKLoginManager()
        
        fbLoginManager.logIn(withReadPermissions: ["email"]) { (result, error) in
            
            if let facebookError = error { //If any error returned from Facebook
                failure(facebookError as NSError?)
                return
            }
            
            if (result?.isCancelled)! { //If user has cancelled the login
                //var canceledError = NSError(errorMessage: self.cancelError);
                
                failure(NSError(domain: self.cancelError, code: 200, userInfo: nil))
                return
            }
            print(result?.token.tokenString)
            success((result?.token.tokenString)!)
        }
        
    }
    
    func fetchLoggedUserInfo(_ facebookToken:String,successBlock success: @escaping ((_ facebookUserInfo:[String : AnyObject]) -> Void),
                                          failureBlock failure: @escaping ((_ error: NSError?) -> Void)) {
        
       // if(FBSDKAccessToken.current().hasGranted("user_photos")) {
        let meRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"email,name,gender,id,birthday"])
            meRequest?.start { (connection, graphObject, error) in
                
                if error != nil {
                    failure(error as NSError?)
                    return
                }
                
                print(connection)
                print(graphObject)
                
                success(graphObject as! [String: AnyObject])
            }
            
        //}
    }
    
    class func logout() {
        FBSDKLoginManager().logOut()
    }


}
 
 */
