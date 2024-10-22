//
//  WaterIntakeView.swift
//  HydrationApp
//
//  Created by BASHAER AZIZ on 19/04/1446 AH.
import SwiftUI

struct WaterIntakeView: View {
    @State private var currentWaterIntake: Double = 0.0
    @State private var dailyWaterIntakeGoal: Double = 2.7

    var body: some View {
        VStack(spacing: 10) { // تقليل المسافة بين العناصر
            HStack {
                Text("Today's Water Intake")
                    .font(.system(size: 16))
                    .foregroundColor(Color(red: 0.384, green: 0.388, blue: 0.401))
                    .multilineTextAlignment(.leading)
                
                Spacer() // يضمن أن النص يبقى على اليسار
            }
            .padding(.leading) // إضافة حشو على اليسار
            
            HStack {
                // العنوان الثاني تحت العنوان الأول
                Text("0.0 liter / 2.7 liter")
                    .font(.system(size: 24, weight: .bold)) // حجم أكبر ووزن خط عريض
                    .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1)) // يمكنك تغيير اللون حسب الحاجة
                    .multilineTextAlignment(.leading)
                
                Spacer()
            }
            .padding(.leading) // إضافة حشو على اليسار

            Spacer() // دفع الدائرة إلى منتصف الشاشة

            WaterIntakeProgressView(currentWaterIntake: $currentWaterIntake, dailyWaterIntakeGoal: dailyWaterIntakeGoal)
                .padding(.bottom, 40) // إضافة حشو علوي لتحريك الدائرة إلى الأسفل
            
            HStack {
                Button(action: {
                    currentWaterIntake = max(currentWaterIntake - 0.1, 0)
                }) {
                    Text("-")
                        .font(.title)
                        .padding()
                }
                
                Text("\(currentWaterIntake.formatted(.number.precision(.fractionLength(1)))) L / \(dailyWaterIntakeGoal.formatted(.number.precision(.fractionLength(1)))) L")
                    .font(.title)
                
                Button(action: {
                    currentWaterIntake = min(currentWaterIntake + 0.1, dailyWaterIntakeGoal)
                }) {
                    Text("+")
                        .font(.title)
                        .padding()
                }
            }
            
            Spacer() // لضمان وجود مساحة في الأسفل
        }
        .padding()
    }
}

struct WaterIntakeProgressView: View {
    @Binding var currentWaterIntake: Double
    let dailyWaterIntakeGoal: Double
    
    var body: some View {
        ZStack {
            // دائرة كبيرة مع إفراغ الداخل
            Circle()
                .stroke(Color.gray.opacity(0.2), lineWidth: 35) // حدود الدائرة
                .frame(width: 320, height: 320) // حجم الدائرة
            
            // صورة صغيرة في المنتصف
            Image(systemName: "water") // استبدل بالصورة الخاصة بك إذا رغبت
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 110, height: 110) // حجم الصورة
            
            // دائرة تمثل استهلاك المياه (الحدود فقط)
            Circle()
                .trim(from: 0, to: currentWaterIntake / dailyWaterIntakeGoal)
                .stroke(Color(red: 0.192, green: 0.68, blue: 0.903), lineWidth: 35) // تغيير لون الحدود
                .frame(width: 320, height: 320) // حجم الدائرة
                .animation(.easeInOut, value: currentWaterIntake) // إضافة حركة عند التغيير
        }
    }
}

struct WaterIntakeView_Previews: PreviewProvider {
    static var previews: some View {
        WaterIntakeView()
    }
}
