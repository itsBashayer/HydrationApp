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



//
//import SwiftUI
//
//struct WaterIntakeView: View {
//    @State private var currentWaterIntake: Double = 0.0
//    @State private var dailyWaterIntakeGoal: Double = 2.7
//
//    var body: some View {
//        VStack(spacing: 10) {
//            HStack {
//                Text("Today's Water Intake")
//                    .font(.system(size: 16))
//                    .foregroundColor(Color(red: 0.384, green: 0.388, blue: 0.401))
//                    .multilineTextAlignment(.leading)
//                
//                Spacer()
//            }
//            .padding(.leading)
//            
//            HStack {
//                Text("\(currentWaterIntake, specifier: "%.1f") liter / \(dailyWaterIntakeGoal, specifier: "%.1f") liter")
//                    .font(.system(size: 24, weight: .bold))
//                    .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
//                    .multilineTextAlignment(.leading)
//                
//                Spacer()
//            }
//            .padding(.leading)
//            
//            Spacer()
//            
//            WaterIntakeProgressView(currentWaterIntake: $currentWaterIntake, dailyWaterIntakeGoal: dailyWaterIntakeGoal)
//                .padding(.top, 70)
//            
//            VStack {
//                // نص لعرض استهلاك المياه الحالي
//                Text("\(currentWaterIntake.formatted(.number.precision(.fractionLength(1)))) L")
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .padding(.top, 50) // إضافة مسافة بين النص والأزرار
//                
//                
//                HStack {
//                    Button(action: {
//                        // تقليل استهلاك المياه
//                        currentWaterIntake = max(currentWaterIntake - 0.1, 0)
//                    }) {
//                        Text("-")
//                            .font(.largeTitle)
//                            .foregroundColor(Color.black)
//                            .frame(width: 50, height: 50)
//                        
//                    }
//                    
//                    Divider()
//                        .frame(height: 50) // تحديد ارتفاع الفاصل ليتناسب مع الأزرار
//                    
//                    Button(action: {
//                        // زيادة استهلاك المياه
//                        currentWaterIntake = min(currentWaterIntake + 0.1, dailyWaterIntakeGoal)
//                    }) {
//                        Text("+")
//                            .font(.title)
//                            .foregroundColor(Color.black)
//                            .frame(width: 50, height: 50)
//                    }
//                }
//                .frame(width: 100, height: 10) // عرض الفريم الذي يحتوي الأزرار
//                .padding()
//                .background(Color(red: 0.933, green: 0.933, blue: 0.942)) // خلفية الفريم
//                .cornerRadius(10) // زاوية دائرية للفريم
//                Spacer()
//            }
//        }
//        .padding()
//    }
//}
//
//struct WaterIntakeProgressView: View {
//    @Binding var currentWaterIntake: Double
//    let dailyWaterIntakeGoal: Double
//    
//    var body: some View {
//        ZStack {
//            // دائرة كبيرة مع إفراغ الداخل
//            Circle()
//                .stroke(Color.gray.opacity(0.2), lineWidth: 29)
//                .frame(width: 320, height: 320)
//            
//            // أيقونة الماء في المنتصف
//            Image(systemName: "zzz") // استخدم أيقونة الماء
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 110, height: 110)
//                .foregroundColor(Color(red: 1.0, green: 0.8, blue: 0.006)) // تغيير لون الأيقونة
//            
//            // دائرة تمثل استهلاك المياه (الحدود فقط)
//            Circle()
//                .trim(from: 0, to: currentWaterIntake / dailyWaterIntakeGoal)
//                .stroke(Color(red: 0.192, green: 0.68, blue: 0.903), lineWidth: 29)
//                .frame(width: 320, height: 320)
//                .rotationEffect(Angle(degrees: 998))
//                .animation(.easeInOut, value: currentWaterIntake)
//        }
//    }
//}
//
//struct WaterIntakeView_Previews: PreviewProvider {
//    static var previews: some View {
//        WaterIntakeView()
//    }
//}
//
////////// CODE 3
///
/////
//import SwiftUI
//
//struct WaterIntakeView: View {
//    @State private var currentWaterIntake: Double = 0.0
//    @State private var dailyWaterIntakeGoal: Double = 2.7
//
//    private let icons = [
//        "zzz",
//        "tortoise.fill",
//        "hare.fill",
//        "hands.clap.fill"
//    ]
//
//    private let changeAmount: Double = 0.1
//
//    var body: some View {
//        VStack(spacing: 10) {
//            HStack {
//                Text("Today's Water Intake")
//                    .font(.system(size: 16))
//                    .foregroundColor(Color(red: 0.384, green: 0.388, blue: 0.401))
//                    .multilineTextAlignment(.leading)
//
//                Spacer()
//            }
//            .padding(.leading)
//
//            HStack {
//                // النص الذي يعرض استهلاك المياه
//                Text("\(currentWaterIntake, specifier: "%.1f") liter")
//                    .font(.system(size: 24, weight: .bold))
//                    .foregroundColor(currentWaterIntake >= dailyWaterIntakeGoal ? Color.green : Color(red: 0.1, green: 0.1, blue: 0.1))
//
//                // النص الذي يعرض الهدف (يبقى بلونه الأصلي)
//                Text(" / \(dailyWaterIntakeGoal, specifier: "%.1f") liter")
//                    .font(.system(size: 24, weight: .bold))
//                    .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
//
//                Spacer()
//            }
//            .padding(.leading)
//
//            Spacer()
//
//            WaterIntakeProgressView(
//                currentWaterIntake: $currentWaterIntake,
//                dailyWaterIntakeGoal: dailyWaterIntakeGoal,
//                currentIcon: getCurrentIcon(),
//                currentColor: Color.yellow
//            )
//            .padding(.top, 70)
//
//            VStack {
//                Text("\(currentWaterIntake.formatted(.number.precision(.fractionLength(1)))) L")
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .padding(.top, 50)
//                    .foregroundColor(Color.black) // يبقى باللون الأسود
//
//                HStack {
//                    Button(action: {
//                        decreaseWaterIntake()
//                    }) {
//                        Text("-")
//                            .font(.largeTitle)
//                            .foregroundColor(Color.black)
//                            .frame(width: 50, height: 50)
//                    }
//
//                    Divider()
//                        .frame(height: 50)
//
//                    Button(action: {
//                        increaseWaterIntake()
//                    }) {
//                        Text("+")
//                            .font(.title)
//                            .foregroundColor(Color.black)
//                            .frame(width: 50, height: 50)
//                    }
//                }
//                .frame(width: 100, height: 10)
//                .padding()
//                .background(Color(red: 0.933, green: 0.933, blue: 0.942))
//                .cornerRadius(10)
//                Spacer()
//            }
//        }
//        .padding()
//    }
//
//    private func getCurrentIcon() -> String {
//        switch currentWaterIntake {
//        case 0..<0.5:
//            return icons[0]
//        case 0.5..<0.9:
//            return icons[1]
//        case 0.9..<2.7:
//            return icons[2]
//        default:
//            return icons[3]
//        }
//    }
//
//    private func increaseWaterIntake() {
//        currentWaterIntake += changeAmount
//        currentWaterIntake = min(currentWaterIntake, dailyWaterIntakeGoal)
//    }
//
//    private func decreaseWaterIntake() {
//        currentWaterIntake = max(currentWaterIntake - changeAmount, 0)
//    }
//}
//
//struct WaterIntakeProgressView: View {
//    @Binding var currentWaterIntake: Double
//    let dailyWaterIntakeGoal: Double
//    let currentIcon: String
//    let currentColor: Color
//
//    var body: some View {
//        ZStack {
//            Circle()
//                .stroke(Color.gray.opacity(0.2), lineWidth: 29)
//                .frame(width: 313, height: 313)
//
//            Image(systemName: currentIcon)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 110, height: 110)
//                .foregroundColor(currentColor)
//
//            Circle()
//                .trim(from: 0, to: currentWaterIntake / dailyWaterIntakeGoal)
//                .stroke(Color(red: 0.192, green: 0.68, blue: 0.903), style: StrokeStyle(lineWidth: 28, lineCap: .round))
//                .frame(width: 313, height: 313)
//                .rotationEffect(Angle(degrees: 270))
//                .animation(.easeInOut, value: currentWaterIntake)
//        }
//    }
//}
//
//struct WaterIntakeView_Previews: PreviewProvider {
//    static var previews: some View {
//        WaterIntakeView()
//    }
//}
//




//Code Page 1
//import SwiftUI
//
//struct HydrateView: View {
//    @State private var inputText: String = ""
//    @State private var dailyWaterIntake: Double? = nil // لتخزين كمية المياه المحسوبة
//
//    var body: some View {
//        NavigationView {
//            VStack(alignment: .leading) {
//             
//                Image(systemName: "drop.fill")
//                    .font(.system(size: 80))
//                    .foregroundColor(Color(red: 0.192, green: 0.68, blue: 0.903))
//                    .padding(.top, 100)
//                
//                Text("Hydrate")
//                    .font(.title)
//                    .fontWeight(.semibold)
//
//                Text("Start with Hydrate to record and track your water intake daily based on your needs and stay hydrated")
//                    .font(.system(size: 19))
//                    .foregroundColor(Color(red: 0.388, green: 0.388, blue: 0.401))
//                    .padding(.vertical, 30)
//
//                HStack {
//                    Text("Body weight").padding()
//                    TextField("Value", text: $inputText)
//                        .keyboardType(.decimalPad) // السماح بإدخال الأعداد العشرية
//                    if inputText.isEmpty {
//                        Button(action: {
//                            inputText = ""
//                        }) {
//                            Image(systemName: "xmark.circle.fill")
//                                .foregroundColor(.gray)
//                        }
//                        .padding(.trailing, 10) // علامة X
//                    }
//                }
//                .frame(height: 20)
//                .padding()
//                .background(Color(red: 0.949, green: 0.949, blue: 0.971))
//                .cornerRadius(10)
//
//                // عرض كمية المياه المحسوبة
//                if let waterIntake = dailyWaterIntake {
//                    Text("Daily Water Intake: \(waterIntake, specifier: "%.1f") liters")
//                        .font(.headline)
//                        .padding(.top)
//                }
//
//                Spacer()
//
//                // تعديل NavigationLink للانتقال إلى WaterIntakeView
////                NavigationLink(destination: WaterIntakeView(dailyWaterIntake: dailyWaterIntake ?? 0)) {
//                    Text("Next")
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(Color(red: 0.192, green: 0.68, blue: 0.903))
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                        .simultaneousGesture(TapGesture().onEnded {
//                            calculateWaterIntake() // حساب كمية المياه عند الضغط على الزر
//                        })
//                }
//                .padding(.top)
//            }
//            .padding()
//        }
//    //}
//
//    // وظيفة لحساب كمية المياه اليومية
//    private func calculateWaterIntake() {
//        guard let weight = Double(inputText) else {
//            dailyWaterIntake = nil // إعادة تعيين إذا كانت المدخلة غير صحيحة
//            return
//        }
//        dailyWaterIntake = weight * 0.03 // حساب كمية المياه باللترات
//    }
//}
//
//struct DestinationView: View {
//    var body: some View {
//        Text("Next!")
//            .font(.largeTitle)
//    }
//}
//
//struct HydrateView_Previews: PreviewProvider {
//    static var previews: some View {
//        HydrateView()
//    }
//}
