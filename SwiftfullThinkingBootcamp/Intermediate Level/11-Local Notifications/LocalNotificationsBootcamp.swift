//
//  LocalNotificationsBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 9.11.2024.
//

import SwiftUI
import UserNotifications

class NotificationManager {
    static var shared = NotificationManager()
    private init() { }
    
    enum NotificationRequestType {
        case time
        case calendar
    }
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error {
                print("Error: \(error.localizedDescription)")
            } else if success  {
                print("Success")
            }
        }
    }
    
    func scheduleNotification(of type: NotificationRequestType) {
        let content = UNMutableNotificationContent()
        content.title = "This is my first notification title"
        content.subtitle = "This is my first notification subtitle"
        content.sound = .default
        content.badge = 1
        
        var trigger: UNNotificationTrigger = switch type {
        case .time:
            UNTimeIntervalNotificationTrigger(timeInterval: 30, repeats: false)
        case .calendar:
            UNCalendarNotificationTrigger(dateMatching: DateComponents(hour: 16, minute: 15),
                                          repeats: false)
        }
        
        let request = UNNotificationRequest(identifier: UUID().uuidString,
                                            content: content,
                                            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}

struct LocalNotificationsBootcamp: View {
    var body: some View {
        VStack(spacing: 32) {
            Button("Request Authorization") {
                NotificationManager.shared.requestAuthorization()
            }
            
            Button("Schedule Notification with Time") {
                NotificationManager.shared.scheduleNotification(of: .time)
            }
            
            Button("Schedule Notification with Calendar") {
                NotificationManager.shared.scheduleNotification(of: .calendar)
            }
            
            Button("Remove notifications") {
                NotificationManager.shared.cancelNotifications()
            }
        }
    }
}

#Preview {
    LocalNotificationsBootcamp()
}
