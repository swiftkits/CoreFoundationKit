//
//  DateTimeProvider.swift
//  CoreFoundationKit
//
//  Created by Manish on 17/10/21.
//

import Foundation

/// Provide initial information about date and time
public protocol DateTimeProvider {
    var day: Int    { get }
    var month: Int  { get }
    var year: Int   { get }
    
    var hour: Int   { get }
    var minute: Int { get }
    var second: Int { get }
    
    var timezone: TimeZone  { get }
    var locale: Locale      { get }
    var calendar: Calendar  { get }
}
