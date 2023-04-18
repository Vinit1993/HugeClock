//
//  DateHelper.swift
//  HugeClock
//
//  Created by Vinit Ingale on 18/04/23.
//

import Foundation

struct DateHelper {
    static func getHH_MM_FormatTimeString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        let string = dateFormatter.string(from: date)
        return string
    }
}

