//
//  WaterIntakeView.swift
//  HydrationApp
//
//  Created by BASHAER AZIZ on 19/04/1446 AH.

import SwiftUI

struct WaterIntakeView: View {
    @State private var currentWaterIntake: Double = 0.0
    var dailyWaterIntakeGoal: Double 

    private let icons = [
        "zzz",
        "tortoise.fill",
        "hare.fill",
        "hands.clap.fill"
    ]

    private let changeAmount: Double = 0.1

    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("Today's Water Intake")
                    .font(.system(size: 16))
                    .foregroundColor(Color(red: 0.384, green: 0.388, blue: 0.401))
                    .multilineTextAlignment(.leading)

                Spacer()
            }
            .padding(.leading)

            HStack {
                Text("\(currentWaterIntake, specifier: "%.1f") liter")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(currentWaterIntake >= dailyWaterIntakeGoal ? Color.green : Color(red: 0.1, green: 0.1, blue: 0.1))

                Text(" / \(dailyWaterIntakeGoal, specifier: "%.1f") liter")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))

                Spacer()
            }
            .padding(.leading)

            Spacer()

            WaterIntakeProgressView(
                currentWaterIntake: $currentWaterIntake,
                dailyWaterIntakeGoal: dailyWaterIntakeGoal,
                currentIcon: getCurrentIcon(),
                currentColor: Color.yellow
            )
            .padding(.top, 70)

            VStack {
                Text("\(currentWaterIntake.formatted(.number.precision(.fractionLength(1)))) L")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 50)
                    .foregroundColor(Color.black)

                HStack {
                    Button(action: {
                        decreaseWaterIntake()
                    }) {
                        Text("-")
                            .font(.largeTitle)
                            .foregroundColor(Color.black)
                            .frame(width: 50, height: 50)
                    }

                    Divider()
                        .frame(height: 50)

                    Button(action: {
                        increaseWaterIntake()
                    }) {
                        Text("+")
                            .font(.title)
                            .foregroundColor(Color.black)
                            .frame(width: 50, height: 50)
                    }
                }
                .frame(width: 100, height: 10)
                .padding()
                .background(Color(red: 0.933, green: 0.933, blue: 0.942))
                .cornerRadius(10)
                Spacer()
            }
        }
        .padding()
    }

    private func getCurrentIcon() -> String {
        switch currentWaterIntake {
        case 0..<0.5:
            return icons[0]
        case 0.5..<0.9:
            return icons[1]
        case 0.9..<dailyWaterIntakeGoal:
            return icons[2]
        default:
            return icons[3]
        }
    }

    private func increaseWaterIntake() {
        currentWaterIntake += changeAmount
        currentWaterIntake = min(currentWaterIntake, dailyWaterIntakeGoal)
    }

    private func decreaseWaterIntake() {
        currentWaterIntake = max(currentWaterIntake - changeAmount, 0)
    }
}

struct WaterIntakeProgressView: View {
    @Binding var currentWaterIntake: Double
    let dailyWaterIntakeGoal: Double
    let currentIcon: String
    let currentColor: Color

    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.2), lineWidth: 29)
                .frame(width: 313, height: 313)

            Image(systemName: currentIcon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 110, height: 110)
                .foregroundColor(currentColor)

            Circle()
                .trim(from: 0, to: currentWaterIntake / dailyWaterIntakeGoal)
                .stroke(Color(red: 0.192, green: 0.68, blue: 0.903), style: StrokeStyle(lineWidth: 28, lineCap: .round))
                .frame(width: 313, height: 313)
                .rotationEffect(Angle(degrees: 270))
                .animation(.easeInOut, value: currentWaterIntake)
        }
    }
}

struct WaterIntakeView_Previews: PreviewProvider {
    static var previews: some View {
        WaterIntakeView(dailyWaterIntakeGoal: 2.7) 
    }
}
