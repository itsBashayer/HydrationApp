//
//  WaterIntakeViewModel.swift
//  Hey
//
//  Created by BASHAER AZIZ on 25/04/1446 AH.
//
import Foundation
import UserNotifications

class WaterIntakeViewModel: ObservableObject {
    @Published var model = WaterIntakeModel()
    
    private let icons = ["zzz", "tortoise.fill", "hare.fill", "hands.clap.fill"]
    private let changeAmount: Double = 0.1
    
    init() {
        setupNotifications()
        model.dailyWaterIntakeGoal = UserDefaults.standard.double(forKey: "waterIntake")
        if model.dailyWaterIntakeGoal == 0 {
            model.dailyWaterIntakeGoal = 2.7
        }
    }

    private func setupNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            if granted {
                print("Permission granted")
            } else if let error = error {
                print("Error requesting permission: \(error)")
            }
        }
    }

    func increaseWaterIntake() {
        model.currentWaterIntake += changeAmount
        model.currentWaterIntake = min(model.currentWaterIntake, model.dailyWaterIntakeGoal)
        checkNotifications()
    }

    func decreaseWaterIntake() {
        model.currentWaterIntake = max(model.currentWaterIntake - changeAmount, 0)
        checkNotifications()
    }

    private func checkNotifications() {
        if model.currentWaterIntake >= 0.4 && model.currentWaterIntake < 0.5 {
            scheduleNotification(title: "Stay Hydrated!", body: "You're almost at 0.5L! Keep going!")
        }
        if model.currentWaterIntake >= model.dailyWaterIntakeGoal {
            scheduleNotification(title: "Great Job!", body: "You've reached your goal for the day!")
        }
        if model.currentWaterIntake >= model.dailyWaterIntakeGoal * 0.9 && model.currentWaterIntake < model.dailyWaterIntakeGoal {
            scheduleNotification(title: "Almost There!", body: "You're at 90% of your daily goal!")
        }
    }

    private func scheduleNotification(title: String, body: String) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error)")
            } else {
                print("Notification scheduled: \(title)")
            }
        }
    }
    
    func getCurrentIcon() -> String {
        switch model.currentWaterIntake {
        case 0..<0.5:
            return icons[0]
        case 0.5..<0.9:
            return icons[1]
        case 0.9..<model.dailyWaterIntakeGoal:
            return icons[2]
        default:
            return icons[3]
        }
    }
}
