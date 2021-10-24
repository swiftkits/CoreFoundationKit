//
//  DateTimeProvider.swift
//  CoreFoundationKit
//
//  Created by Manish on 17/10/21.
//

import Foundation

/// Provide initial information about date and time
public protocol DateTimeProvider {
    
    /// Day of the date
    var day: Int    { get }
    
    /// Month of the date
    var month: Int  { get }
    
    /// Year of the date
    var year: Int   { get }
    
    /// Houre of the date
    var hour: Int   { get }
    
    /// Minute of the date
    var minute: Int { get }
    
    /// Second of the date
    var second: Int { get }
    
    /// TimeZone information of the date
    var timezone: TimeZone  { get }
    
    /// Local information of the date
    var locale: Locale      { get }
    
    /// Calendar information of the date
    var calendar: Calendar  { get }
}
