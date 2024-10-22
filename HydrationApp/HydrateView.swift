//
//  Untitled.swift
//  HydrationApp
//
//  Created by BASHAER AZIZ on 18/04/1446 AH.

import SwiftUI

struct HydrateView: View {
    @State private var inputText: String = ""

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Spacer()

                Image(systemName: "drop.fill")
                    .font(.system(size: 80))
                    .foregroundColor(Color(red: 0.192, green: 0.68, blue: 0.903))
                    .padding(.bottom, 5.0)
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
                    if inputText.isEmpty {
                        Button(action: {
                            inputText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                        }
                        .padding(.trailing, 10)// x sighn
                    }
                }.frame(height: 20)
                    .padding() // Add padding around the HStack
                    .background(Color(red: 0.949, green: 0.949, blue: 0.971)) // Set the background color here
                    .cornerRadius(10) // Optional: add rounded corners

               

                Spacer()

                NavigationLink(destination: NotificationPreferencesView()) {
                    Text("Next")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 0.192, green: 0.68, blue: 0.903))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top)

            }
            .padding()
        }
    }
}

struct DestinationView: View {
    var body: some View {
        Text("Next!")
            .font(.largeTitle)
    }
}

struct HydrateView_Previews: PreviewProvider {
    static var previews: some View {
        HydrateView()
    }
}
