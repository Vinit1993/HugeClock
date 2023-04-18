//
//  Alarm.swift
//  HugeClock
//
//  Created by Vinit Ingale on 13/04/23.
//

import Foundation

struct Alarm: Codable {
    let id: String
    let name: String
    let time: Date
    var enabled: Bool
    var deleted: Bool
}
