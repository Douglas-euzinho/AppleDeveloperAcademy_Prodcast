//
//  NotificationManager.swift
//  PodcastApp
//
//  Created by Igor Samoel da Silva on 20/01/22.
//

import Foundation
import UserNotifications


class NoticationManager {
    
    static var shared = NoticationManager()
    
    private var current = UNUserNotificationCenter.current()
    
    
    
    func createNotification(notification: Notification ) {
        let listOfTriggers = createTriggerToSelectedDays(notification: notification)
        createRequest(triggers: listOfTriggers)
    }
    
    
    private func createTriggerToSelectedDays(notification: Notification) -> [UNCalendarNotificationTrigger] {
        
        guard let hour = notification.hour, let weekday = notification.days else { return [] }
        
        let days: [Bool] = [weekday.sunday, weekday.monday, weekday.tuersday, weekday.wednesday, weekday.thursday, weekday.friday, weekday.saturday]
        
        var listOfTriggers: [UNCalendarNotificationTrigger] = []
        
        for i in 1...7 {
            if days[i-1] {
                listOfTriggers.append(createTrigger(weekDay: i, hour: hour))
            }
        }
        return listOfTriggers
    }
    
    
    
    
    
    private func createTrigger(weekDay: Int, hour: Date) -> UNCalendarNotificationTrigger {
        
        var dateComponent = DateComponents()
        dateComponent.weekday = weekDay
        dateComponent.hour = Calendar.current.component(.hour, from: hour)
        return UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)
        
    }
    
    
    
    private func createRequest(triggers: [UNCalendarNotificationTrigger]) {
        
    }
    
    
    
    
    func removeNotification() {
        
    }
    
    
    func requestUserPermission() {
        
    }
    
}
