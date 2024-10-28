//
//  HydrationModel.swift
//  Hey
//
//  Created by BASHAER AZIZ on 25/04/1446 AH.
//
import Foundation

struct HydrationModel {
    var bodyWeight: Double = 0.0
    var dailyWaterIntakeGoal: Double {
        return bodyWeight * 0.03
    }
}
