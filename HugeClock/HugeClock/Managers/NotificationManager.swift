//
//  NotificationManager.swift
//  HugeClock
//
//  Created by Vinit Ingale on 18/04/23.
//

import Foundation
import NotificationCenter

protocol NotificationManagerProtocol {
    func addNotification(_ alarm: Alarm)
    func deleteNotification(_ alarm: Alarm)
}

class NotificationManager: NotificationManagerProtocol {
    func addNotification(_ alarm: Alarm) {
        let content = UNMutableNotificationContent()
        content.title = "Alarm"
        content.body = alarm.name
        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: alarm.time.timeIntervalSinceNow, repeats: false)
        let request = UNNotificationRequest(identifier: alarm.id, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    func deleteNotification(_ alarm: Alarm) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [alarm.id])
    }
}
