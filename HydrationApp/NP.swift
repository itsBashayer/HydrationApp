//
//  NP.swift
//  HydrationApp
//
//  Created by BASHAER AZIZ on 25/04/1446 AH.
//
//import SwiftUI
//import UserNotifications
//
//struct NP: View {
//    @State private var startHour: Date = Date()
//    @State private var endHour: Date = Date().addingTimeInterval(3600) // Default to 1 hour later
//    @State private var selectedBox: Int?
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 20) {
//            HStack {
//                Spacer().frame(width: 10)
//                Text("Notification Preferences")
//                    .font(.title2)
//                    .bold()
//                    .padding(.bottom, 20)
//            }
//            .padding(.top, 30)
//
//            VStack(alignment: .leading, spacing: 5) {
//                HStack {
//                    Spacer().frame(width: 10)
//                    Text("The start and End hour")
//                        .font(.headline)
//                        .foregroundColor(Color.black)
//                        .multilineTextAlignment(.leading)
//                        .bold()
//                }
//                HStack {
//                    Spacer().frame(width: 10)
//                    Text("Specify the start and end date to receive the notifications")
//                        .font(.system(size: 16))
//                        .foregroundColor(Color(red: 0.365, green: 0.365, blue: 0.378))
//                }
//            }
//            .padding(.bottom, 10)
//
//            startAndEndHourSection
//
//            VStack(alignment: .leading, spacing: 5) {
//                HStack {
//                    Spacer().frame(width: 10)
//                    Text("Notification interval")
//                        .font(.headline)
//                        .bold()
//                        .padding(.bottom, 10)
//                }
//                .padding(.top, 10)
//
//                HStack {
//                    Spacer().frame(width: 10)
//                    Text("How often would you like to receive notifications within the specified time interval")
//                        .font(.system(size: 16))
//                        .foregroundColor(Color(red: 0.384, green: 0.388, blue: 0.401))
//                        .multilineTextAlignment(.leading)
//                }
//            }
//
//            //  المربعات
//            VStack(spacing: 10) {
//                HStack(spacing: 20) {
//                    Spacer()
//                    smallBox(number: 15, label: "Mins", index: 0)
//                    smallBox(number: 30, label: "Mins", index: 1)
//                    smallBox(number: 60, label: "Mins", index: 2)
//                    smallBox(number: 90, label: "Mins", index: 3)
//                    Spacer()
//                }
//                HStack(spacing: 20) {
//                    Spacer()
//                    smallBox(number: 2, label: "Hours", index: 4)
//                    smallBox(number: 3, label: "Hours", index: 5)
//                    smallBox(number: 4, label: "Hours", index: 6)
//                    smallBox(number: 5, label: "Hours", index: 7)
//                    Spacer()
//                }
//            }
//            .padding(.top, 20)
//
//            Spacer()
//
//            HStack {
//                Spacer()
//                Button(action: scheduleNotifications) {
//                    Text("Schedule Notifications")
//                        .padding(.vertical, 10)
//                        .frame(width: 360, height: 50)
//                        .background(Color(red: 0.192, green: 0.68, blue: 0.903))
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                }
//                Spacer()
//            }
//            .padding(.bottom, 20)
//        }
//    }
//
//    private var startAndEndHourSection: some View {
//        VStack(spacing: 0) {
//            startHourInput
//            Divider()
//            endHourInput
//        }
//        .padding()
//        .background(Color(red: 0.949, green: 0.949, blue: 0.971))
//        .frame(maxWidth: .infinity)
//        .padding(.horizontal)
//    }
//
//    private var startHourInput: some View {
//        HStack {
//            Text("Start hour")
//                .font(.body)
//                .padding(.bottom, 20)
//
//            Spacer()
//
//            DatePicker("", selection: $startHour, displayedComponents: .hourAndMinute)
//                .labelsHidden()
//                .frame(width: 180)
//        }
//        .frame(height: 50)
//    }
//
//    private var endHourInput: some View {
//        HStack {
//            Text("End hour")
//                .font(.body)
//                .padding(.top, 10)
//            Spacer()
//
//            DatePicker("", selection: $endHour, displayedComponents: .hourAndMinute)
//                .labelsHidden()
//                .frame(width: 180)
//        }
//        .frame(height: 50)
//    }
//
//    private func smallBox(number: Int, label: String, index: Int) -> some View {
//        let isSelected = selectedBox == index
//        let textColor = isSelected ? Color.white : Color.black
//        let numberColor = isSelected ? Color.white : Color(red: 0.192, green: 0.68, blue: 0.903)
//
//        return VStack {
//            Text("\(number)")
//                .font(.headline)
//                .foregroundColor(numberColor)
//            Text(label)
//                .font(.subheadline)
//                .foregroundColor(textColor)
//        }
//        .frame(width: 70, height: 70)
//        .background(isSelected ? Color(red: 0.192, green: 0.68, blue: 0.903) : Color(red: 0.949, green: 0.949, blue: 0.971))
//        .cornerRadius(10)
//        .onTapGesture {
//            selectedBox = index
//        }
//    }
//
//    private func scheduleNotifications() {
//        let center = UNUserNotificationCenter.current()
//        
//        // Check if the start time is before the end time
//        guard startHour < endHour else {
//            print("Start time must be before end time.")
//            return
//        }
//
//        // Create content for the notification
//        let content = UNMutableNotificationContent()
//        content.title = "Notification Alert"
//        content.body = "Notifications scheduled from \(startHour.formatted()) to \(endHour.formatted())."
//        content.sound = .default
//
//        // Schedule the notification
//        let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: startHour)
//        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
//
//        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
//        center.add(request) { error in
//            if let error = error {
//                print("Error scheduling notification: \(error.localizedDescription)")
//            }
//        }
//    }
//}
//
//struct NP_Previews: PreviewProvider {
//    static var previews: some View {
//        NP()
//    }
//}
