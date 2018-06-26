//
//  DateExtension.swift
//  Utility
//
//  Created by Kiran Gurung on 26/6/18.
//  Copyright © 2018 Kiran Gurung. All rights reserved.
//

import Foundation




extension Date {
    
    var aWeekAgo: Date {
        return Calendar.current.date(byAdding: .weekOfMonth, value: -1, to: self)!
    }
    
    var startOfWeek: Date? {
        let gregorian = Calendar(identifier: .gregorian)
        guard let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
        return gregorian.date(byAdding: .day, value: 1, to: sunday)
    }
    
    var endOfWeek: Date? {
        let gregorian = Calendar(identifier: .gregorian)
        guard let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
        return gregorian.date(byAdding: .day, value: 7, to: sunday)
    }
    
    var yesterday: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: dayStart)!
    }
    var tomorrow: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: dayStart)!
    }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var dayStart: Date {
        return Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: self)!
    }
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    var isLastDayOfMonth: Bool {
        return tomorrow.month != month
    }
}
