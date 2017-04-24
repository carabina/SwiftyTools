//
//  DateTools.swift
//  SwiftTools
//
//  Created by Vladas Zakrevskis on 3/1/17.
//  Copyright © 2017 Vladas Zakrevskis. All rights reserved.
//

import Foundation
import AVFoundation

fileprivate let dateTimeFormatter    = DateFormatter("HH:mm dd-MM-yyyy")
fileprivate let dateFormatter        = DateFormatter("dd-MM-yyyy")
fileprivate let hourMinTimeFormatter = DateFormatter("HH:mm")
fileprivate let minSecTimeFormatter  = DateFormatter("mm:ss")

public extension DateFormatter {
    
    public convenience init(_ format: String) {
        
        self.init()
        self.dateFormat = format
    }
}

public extension Date {
    
    public static func parse(_ dateString: String) -> Date {
        
        if let date = dateTimeFormatter.date(from: dateString) {
            
            return date
        }
        
        Log.error()
        return Date()
    }
    
    public func stringWithFormat(_ format: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    private static let cal = Calendar(identifier: .gregorian)
    
    public var withoutTimeComponent: Date {
        
        return Date.cal.date(bySetting: .minute, value: 0, of: Date.cal.date(bySetting: .hour, value: 0, of: self)!)!
    }
    
    public var timeString: String {
        
        return hourMinTimeFormatter.string(from: self)
    }
    
    public var dateString: String {
        
        return dateFormatter.string(from: self)
    }
    
    public static var currentDateTimeString: String {
        
        return dateTimeFormatter.string(from: Date())
    }
    
    public static var currentDateString: String {
        
        return dateFormatter.string(from: Date())
    }
}

public extension Int {
    
    public var hoursMinuteString: String {
        
        let date = Date(timeIntervalSinceReferenceDate: TimeInterval(self))
        return minSecTimeFormatter.string(from: date)
    }
}

public extension CMTime {
    
    public var String: String {
        
        let date = Date(timeIntervalSinceReferenceDate: CMTimeGetSeconds(self))
        return hourMinTimeFormatter.string(from: date)
    }
    
}