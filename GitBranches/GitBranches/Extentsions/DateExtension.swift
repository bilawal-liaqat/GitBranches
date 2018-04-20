//
//  DateExtension.swift
//  HSK
//
//  Created by Talha Ejaz on 21/10/2016.
//  Copyright © 2016 consultant. All rights reserved.
//

import UIKit

extension Date {
    var age: Int {
        return Calendar.current.dateComponents([.year], from: self, to: Date()).year!
    }
    
   static func dateFromMilliseconds(_ ms: String) -> Date {
        let secDouble = Double (ms)
        //let secs = secDouble *1000.0
        //QL1("milli secs:\(msecs) , date converted:\( NSDate(timeIntervalSince1970:msecs))")
        //return Date(timeIntervalSince1970:secs)
    
    return  Date(timeIntervalSince1970: (secDouble! / 1000.0))
    }
    
    static func dateFromString(date:String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let s = dateFormatter.date(from: date)
        return s!
    }
    static func dateFromStringLong(date:String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let s = dateFormatter.date(from: date)
        return s!
    }
    static func stringFromDateComplete(date:Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let dateForrmatted = dateFormatter.string(from:date)
        return dateForrmatted
    }
    
    static func invitationDateFromString(date:String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, MMM dd, yyyy hh:mm a"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        let s = dateFormatter.date(from: date)
        return s!
    }
    
    static func stringFromDate(date:Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateForrmatted = dateFormatter.string(from:date)
        return dateForrmatted
    }
    static func stringFromDateServer(date:Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateForrmatted = dateFormatter.string(from:date)
        return dateForrmatted
    }
    
    static func stringFromDateShort(date:Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE dd MMMM yyyy"
        let dateForrmatted = dateFormatter.string(from:date)
        return dateForrmatted
    }
    
    static func messageDateFromString(str:String, timezone:String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = NSTimeZone(name: timezone) as TimeZone!
        let date =  dateFormatter.date(from: str)
        return date!
    }
    
    static func messageTimeFromDate(date:Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, MMM dd, yyyy @ hh:mm a"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        let dateForrmatted = dateFormatter.string(from:date)
        return dateForrmatted
    }
    static func messageDetailTimeFromDate(date:Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, MMM dd, yyyy"
       
        let dateForrmatted = dateFormatter.string(from:date)
        return dateForrmatted
    }
}
