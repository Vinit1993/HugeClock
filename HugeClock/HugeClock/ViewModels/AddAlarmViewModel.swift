//
//  AddAlarmViewModel.swift
//  HugeClock
//
//  Created by Vinit Ingale on 13/04/23.
//

import Foundation

class AlarmViewModel {
    private let alarmManager: AlarmManagerProtocol
    private var alarms: [Alarm] = []
    
    let title = "Title"
    var numberOfAlarms: Int {
        return alarms.count
    }
    
    init(alarmManager: AlarmManagerProtocol) {
        self.alarmManager = alarmManager
        self.alarms = alarmManager.getAlarms()
    }
    
    func addAlarm(alarm: Alarm) {
        alarmManager.addAlarm(alarm)
    }
    
    func toggleAlarm(alarm: Alarm) {
        alarmManager.toggleAlarm(alarm)
    }
    
    func deleteAlarm(alarm: Alarm) {
        alarmManager.deleteAlarm(alarm)
    }
}
