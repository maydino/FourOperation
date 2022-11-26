//
//  NotificationManager.swift
//  FourOperations
//
//  Created by Mutlu Aydin on 11/15/22.
//

import UIKit
import NotificationCenter

class NotificationManager {
    
    let userNotificationCenter = UNUserNotificationCenter.current()
    private let savedDate: Date? = UserDefaultKey.defaults.object(forKey: UserDefaultKey.dailyReminderTime) as? Date

    //MARK: - Authorization Request From x
    func requestNotificationAuthorization() {
        let authOptions = UNAuthorizationOptions.init(arrayLiteral: .alert, .badge, .sound)
        
        self.userNotificationCenter.requestAuthorization(options: authOptions) { (success, error) in
            if success {
                print("Success!!!")
                
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    //MARK: - Send notification request to OS
    func sendNotification(hour: Int, minute: Int, idString: String) {
        
        // Content
        let content = UNMutableNotificationContent()
        content.title = "Hey!"
        content.body =  "Time to practice four operations 🤩"
        
        // Date Component
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute
    
        // Trigger
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

        // Register the request
        let request = UNNotificationRequest(identifier: idString,
                                            content: content,
                                            trigger: trigger)
        
        userNotificationCenter.add(request) { (error) in
            if let error = error {
                print("Notification Error: ", error)
            }
        }
    
    }
    
    // Remove notification
    func removeNotification(idString: String) {
        userNotificationCenter.removePendingNotificationRequests(withIdentifiers: [idString])
        userNotificationCenter.removeDeliveredNotifications(withIdentifiers: [idString])
    }

}
