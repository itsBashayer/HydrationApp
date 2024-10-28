//
//  NotificationPreferencesViewModel.swift
//  Hey
//
//  Created by BASHAER AZIZ on 25/04/1446 AH.
//
import Foundation
import UserNotifications

class NotificationPreferencesViewModel: ObservableObject {
    @Published var preferences = NotificationPreferences(startHour: Date(), endHour: Date().addingTimeInterval(3600))
    @Published var isNotificationScheduled = false

    func scheduleNotifications() {
        let center = UNUserNotificationCenter.current()

        guard preferences.startHour < preferences.endHour else {
            print("Start time must be before end time.")
            return
        }

        // Use Foundation.TimeInterval to avoid conflicts
        let interval: TimeInterval
        switch preferences.selectedBox {
        case 0:
            interval = 15 * 60 // 15 minutes
        case 1:
            interval = 30 * 60 // 30 minutes
        case 2:
            interval = 60 * 60 // 1 hour
        case 3:
            interval = 90 * 60 // 1.5 hours
        case 4:
            interval = 2 * 3600 // 2 hours
        case 5:
            interval = 3 * 3600 // 3 hours
        case 6:
            interval = 4 * 3600 // 4 hours
        case 7:
            interval = 5 * 3600 // 5 hours
        default:
            print("No valid interval selected")
            return
        }

        let content = UNMutableNotificationContent()
        content.title = "Notification Alert"
        content.body = "Notifications scheduled from \(preferences.startHour.formatted()) to \(preferences.endHour.formatted())."
        content.sound = .default

        var currentDate = preferences.startHour
        while currentDate <= preferences.endHour {
            let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: currentDate)
            let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)

            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request) { error in
                if let error = error {
                    print("Error scheduling notification: \(error.localizedDescription)")
                }
            }

            currentDate.addTimeInterval(interval)
        }

        isNotificationScheduled = true
    }
}
