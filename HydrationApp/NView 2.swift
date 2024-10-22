//
//  NotificationPreferencesView 2.swift
//  HydrationApp
//
//  Created by BASHAER AZIZ on 18/04/1446 AH.
//
//
//import SwiftUI

//struct NotificationPreferencesView: View {
//    @State private var startHour: String = "3:00"
//    @State private var endHour: String = "3:00"
//    @State private var isStartAM: Bool = true
//    @State private var isEndAM: Bool = true
//    @State private var selectedBox: Int?
//
//    var body: some View {
//        NavigationView {
//            VStack(alignment: .leading, spacing: 20) {
//                // عنوان الصفحة
//                HStack {
//                    Spacer().frame(width: 10)
//                    Text("Notification Preferences")
//                        .font(.title2)
//                        .bold()
//                        .padding(.bottom, 20)
//                }
//                .padding(.top, 30)
//
//                // وصف الساعات
//                VStack(alignment: .leading, spacing: 5) {
//                    HStack {
//                        Spacer().frame(width: 10)
//                        Text("The start and End hour")
//                            .font(.headline)
//                            .foregroundColor(Color.black)
//                            .multilineTextAlignment(.leading)
//                            .bold()
//                    }
//                    HStack {
//                        Spacer().frame(width: 10)
//                        Text("Specify the start and end date to receive the notifications")
//                            .font(.system(size: 16))
//                            .foregroundColor(Color(red: 0.365, green: 0.365, blue: 0.378))
//                    }
//                }
//                .padding(.bottom, 10)
//
//                startAndEndHourSection
//
//                // وصف فترة الإشعارات
//                VStack(alignment: .leading, spacing: 5) {
//                    HStack {
//                        Spacer().frame(width: 10) // زيادة العرض هنا لإزاحة النص إلى اليمين
//                        Text("Notification interval")
//                            .font(.headline)
//                            .bold()
//                            .padding(.bottom, 10) // تقليل المسافة السفلية
//                    }
//                    .padding(.top, 10) // إضافة مسافة أعلى للـ HStack
//                
//                    HStack {
//                        Spacer().frame(width: 10) // زيادة العرض هنا لإزاحة النص إلى اليمين
//                        Text("How often would you like to receive notifications within the specified time interval")
//                            .font(.system(size: 16))
//                            .foregroundColor(Color(red: 0.384, green: 0.388, blue: 0.401))
//                            .multilineTextAlignment(.leading)
//                    }
//                }
//
//                // إضافة صفين من المربعات
//                VStack(spacing: 10) {
//                    HStack(spacing: 20) {
//                        Spacer()
//                        smallBox(number: 15, label: "Mins", index: 0)
//                        smallBox(number: 30, label: "Mins", index: 1)
//                        smallBox(number: 60, label: "Mins", index: 2)
//                        smallBox(number: 90, label: "Mins", index: 3)
//                        Spacer()
//                    }
//                    HStack(spacing: 20) {
//                        Spacer()
//                        smallBox(number: 2, label: "Hours", index: 4)
//                        smallBox(number: 3, label: "Hours", index: 5)
//                        smallBox(number: 4, label: "Hours", index: 6)
//                        smallBox(number: 5, label: "Hours", index: 7)
//                        Spacer()
//                    }
//                }
//                .padding(.top, 20)
//
//                Spacer()
//
//                // زر الانتقال إلى الصفحة الأخرى
//                HStack {
//                    Spacer() // هذا سيجعل الزر في المنتصف
//                    NavigationLink(destination: DestinationView()) {
//                        Text("Start")
//                            .padding(.vertical, 10) // التحكم في الارتفاع
//                            .frame(width: 360, height: 50) // التحكم في العرض والارتفاع
//                            .background(Color(red: 0.192, green: 0.68, blue: 0.903))
//                            .foregroundColor(.white)
//                            .cornerRadius(10) // التحكم في الزوايا
//                    }
//                    Spacer() // هذا سيجعل الزر في المنتصف
//                }
//                .padding(.bottom, 20) // إضافة مسافة أسفل الزر
//            }
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
////        .cornerRadius(10)
//        .frame(maxWidth: .infinity) // Extend to fill available width
//        .padding(.horizontal) // Optional padding for spacing on sides
//    }
//
//    private var startHourInput: some View {
//        HStack {
//            Text("Start hour")
//                .font(.body)
//                .padding(.bottom, 20)
//            Spacer()
//
//            TextField("HH:mm", text: $startHour)
//                .keyboardType(.decimalPad)
//                .padding(3)
//                .background(Color.gray.opacity(0.2)) // لون الخلفية
//                .cornerRadius(5)
//                .frame(width: 60, height: 30) // تعديل العرض والارتفاع هنا
//
//            Picker("", selection: $isStartAM) {
//                Text("AM").tag(true)
//                Text("PM").tag(false)
//            }
//            .pickerStyle(SegmentedPickerStyle())
//            .frame(width: 100) // تعديل الحجم هنا
//            
//        }
//        .frame(height: 40) // Height of the HStack
//    }
//
//    private var endHourInput: some View {
//        HStack {
//            Text("End hour")
//                .font(.body)
//                .padding(.top, 10)
//            Spacer()
//
//            TextField("HH:mm", text: $endHour)
//                .keyboardType(.decimalPad)
//                .padding(3)
//                .background(Color.gray.opacity(0.2)) // لون الخلفية
//                .cornerRadius(5)
//                .frame(width: 60, height: 30) // تعديل العرض والارتفاع هنا
//
//            Picker("", selection: $isEndAM) {
//                Text("AM").tag(true)
//                Text("PM").tag(false)
//            }
//            .pickerStyle(SegmentedPickerStyle())
//            .frame(width: 100) // تعديل الحجم هنا
//        }
//        .frame(height: 40) // Height of the HStack
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
//}
//
//struct NotificationPreferencesView_Previews: PreviewProvider {
//    static var previews: some View {
//        NotificationPreferencesView()
//    }
//}
