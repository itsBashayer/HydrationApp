//
//  Untitled.swift
//  HydrationApp
//
//  Created by BASHAER AZIZ on 18/04/1446 AH.

//let defaults = UserDefaults.standard //1
import SwiftUI

struct HydrateView: View {
    @State private var inputText: String = ""
    @State private var dailyWaterIntakeGoal: Double = 0.0
    @State private var navigateToNotificationPreferences = false
    let defaults = UserDefaults.standard
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Image(systemName: "drop.fill")
                    .font(.system(size: 80))
                    .foregroundColor(Color(red: 0.192, green: 0.68, blue: 0.903))
                    .padding(.top, 100)

                Text("Hydrate")
                    .font(.title)
                    .fontWeight(.semibold)

                Text("Start with Hydrate to record and track your water intake daily based on your needs and stay hydrated")
                    .font(.system(size: 19))
                    .foregroundColor(Color(red: 0.388, green: 0.388, blue: 0.401))
                    .padding(.vertical, 30)

                HStack {
                    Text("Body weight").padding()
                    TextField("Value", text: $inputText)
                        .keyboardType(.decimalPad)
                    if !inputText.isEmpty {
                        Button(action: {
                            inputText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                        }
                        .padding(.trailing, 10)
                    }
                }
                .frame(height: 20)
                .padding()
                .background(Color(red: 0.949, green: 0.949, blue: 0.971))
                .cornerRadius(10)

                Spacer()

                NavigationLink(destination: NotificationPreferencesView(), isActive: $navigateToNotificationPreferences) {
                    Button(action: {
//                        dailyWaterIntakeGoal = calculateWaterIntake()
                        navigateToNotificationPreferences = true
                        
                        let t = (Double(inputText) ?? 0.0) * 0.03
                        defaults.set(t, forKey: "waterIntake")
                    }) {
                        Text("Next")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(red: 0.192, green: 0.68, blue: 0.903))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding(.top)
            }
            .padding()
        }
    }

}

struct HydrateView_Previews: PreviewProvider {
    static var previews: some View {
        HydrateView()
    }
}
