//
//  AlarmManager.swift
//  HugeClock
//
//  Created by Vinit Ingale on 13/04/23.
//

import Foundation

protocol AlarmManagerProtocol {
    func addAlarm(_ alarm: Alarm)
    func toggleAlarm(_ alarm: Alarm)
    func deleteAlarm(_ alarm: Alarm)
    func getAlarms() -> [Alarm]
}

struct AlarmManager: AlarmManagerProtocol {
    func addAlarm(_ alarm: Alarm) {
        
    }
    
    func toggleAlarm(_ alarm: Alarm) {
        
    }
    
    func deleteAlarm(_ alarm: Alarm) {
        
    }
    
    func getAlarms() -> [Alarm] {

        return []
    }
}
