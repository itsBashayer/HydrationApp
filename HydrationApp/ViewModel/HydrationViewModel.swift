//
//  HydrationViewModel.swift
//  Hey
//
//  Created by BASHAER AZIZ on 25/04/1446 AH.
//
import Foundation

class HydrationViewModel: ObservableObject {
    @Published var model = HydrationModel()
    @Published var inputText: String = ""

    func saveWaterIntake() {
        let weight = Double(inputText) ?? 0.0
        model.bodyWeight = weight
    }
}
