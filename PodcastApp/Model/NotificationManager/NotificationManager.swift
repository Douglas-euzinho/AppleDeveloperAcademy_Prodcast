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
    
    
    
    func createTrigger(weekDay: Int, hour: Date) -> UNCalendarNotificationTrigger {
        
        var dateComponent = DateComponents()
        dateComponent.weekday = weekDay
        dateComponent.hour = Calendar.current.component(.hour, from: hour)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)
    
        return trigger
    }
    
    func createRequest() {
        
    }
    
    
    func createNotification(notification: Notification ) {
        

        
        
        
    }
    
    //TODO: Complete method
    func getSelectedDays(notification: Notification) {
        guard let hour = notification.hour, let weekday = notification.days else { return }
        let days: [Bool] = [weekday.sunday, weekday.monday, weekday.tuersday, weekday.wednesday, weekday.thursday, weekday.friday, weekday.saturday]
        
        for i in 1...7 {
            if days[i-1] {
               // createTrigger(weekDay: i, hour: hour)
            }
        }
        
    }
    
    
    
    
    func removeNotification() {
        
    }
    

    func requestUserPermission() {
        
    }
    
}
