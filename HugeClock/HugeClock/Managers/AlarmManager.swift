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

class AlarmManager: AlarmManagerProtocol {
    
    private let alarmsKey = "alarms"
    
    private var alarms: [Alarm] {
        get {
            if let alarmsData = UserDefaults.standard.data(forKey: alarmsKey),
               let alarms = try? JSONDecoder().decode([Alarm].self, from: alarmsData) {
                return alarms
            } else {
                return []
            }
        }
        set {
            let alarmsData = try? JSONEncoder().encode(newValue)
            UserDefaults.standard.set(alarmsData, forKey: alarmsKey)
        }
    }

    func addAlarm(_ alarm: Alarm) {
        alarms.append(alarm)
    }
    
    func toggleAlarm(_ alarm: Alarm) {
        if let index = alarms.firstIndex(where: { alarmObject in
            alarmObject.id == alarm.id
        }) {
            alarms[index].enabled.toggle()
        }
    }
    
    func deleteAlarm(_ alarm: Alarm) {
        if let index = alarms.firstIndex(where: { alarmObject in
            alarmObject.id == alarm.id
        }) {
            alarms[index].deleted.toggle()
        }
    }
    
    func getAlarms() -> [Alarm] {
        alarms.filter { $0.deleted == false }
            .sorted { alarm, nextAlarm in
                alarm.time < nextAlarm.time
            }
    }
}
