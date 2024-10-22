//
//  WaterIntakeView.swift
//  HydrationApp
//
//  Created by BASHAER AZIZ on 19/04/1446 AH.
import SwiftUI

struct WaterIntakeView: View {
    @State private var currentWaterIntake: Double = 0.0
    @State private var dailyWaterIntakeGoal: Double = 2.7
    @State private var image: Image? = Image(systemName: "zzz")

    var body: some View {
        VStack(spacing: 20) {
            Text("Today's Water Intake")
                .font(.title)
                .padding(.top)
            
            WaterIntakeProgressView(currentWaterIntake: $currentWaterIntake, dailyWaterIntakeGoal: dailyWaterIntakeGoal, image: $image)
            
            HStack {
                Button(action: {
                    currentWaterIntake = max(currentWaterIntake - 0.1, 0)
                    updateImage()
                }) {
                    Text("-")
                        .font(.title)
                        .padding()
                }
                
                Text("\(currentWaterIntake.formatted(.number.precision(.fractionLength(1)))) L / \(dailyWaterIntakeGoal.formatted(.number.precision(.fractionLength(1)))) L")
                    .font(.title)
                
                Button(action: {
                    currentWaterIntake = min(currentWaterIntake + 0.1, dailyWaterIntakeGoal)
                    updateImage()
                }) {
                    Text("+")
                        .font(.title)
                        .padding()
                }
            }
            
            Spacer()
        }
        .padding()
    }
    
    private func updateImage() {
        if currentWaterIntake == 0 {
            image = Image(systemName: "zzz")
        } else {
            image = Image("your_water_image") // Replace with your actual image
        }
    }
}

struct WaterIntakeProgressView: View {
    @Binding var currentWaterIntake: Double
    let dailyWaterIntakeGoal: Double
    @Binding var image: Image?
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: 200, height: 200)
            
            if let image = image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 160, height: 160)
            }
            
            Circle()
                .trim(from: 0, to: currentWaterIntake / dailyWaterIntakeGoal)
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .fill(LinearGradient(
                    gradient: Gradient(colors: [Color.blue, Color.green]),
                    startPoint: .leading,
                    endPoint: .trailing
                ))
                .frame(width: 200, height: 200)
        }
    }
}

struct WaterIntakeView_Previews: PreviewProvider {
    static var previews: some View {
        WaterIntakeView()
    }
}
