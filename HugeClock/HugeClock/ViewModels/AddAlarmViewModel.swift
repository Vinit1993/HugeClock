//
//  AddAlarmViewModel.swift
//  HugeClock
//
//  Created by Vinit Ingale on 13/04/23.
//

import Foundation

class AlarmViewModel {
    
    private let alarmManager: AlarmManagerProtocol
    private let notificationManager: NotificationManagerProtocol
    private var alarmsArray: [Alarm] = []
    
    func alarms() -> [Alarm] {
        alarmsArray = alarmManager.getAlarms()
        return alarmsArray
    }
    
    init(alarmManager: AlarmManagerProtocol = AlarmManager(),
         notificationManager: NotificationManagerProtocol = NotificationManager()) {
        self.alarmManager = alarmManager
        self.notificationManager = notificationManager
    }
    
    func addAlarm(alarm: Alarm) {
        alarmManager.addAlarm(alarm)
        notificationManager.addNotification(alarm)
    }
    
    func toggleAlarm(index: Int) {
        let alarm = alarmsArray[index]
        alarmManager.toggleAlarm(alarmsArray[index])
        if alarm.enabled {
            notificationManager.addNotification(alarm)
        } else {
            notificationManager.deleteNotification(alarm)
        }
    }
    
    func deleteAlarm(index: Int) {
        let alarm = alarmsArray[index]
        alarmManager.deleteAlarm(alarm)
        notificationManager.deleteNotification(alarm)
    }
}
