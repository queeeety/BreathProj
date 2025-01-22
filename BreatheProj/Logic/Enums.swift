//
//  File.swift
//  Breathe
//
//  Created by Tymofii Bezverkhyi on 21.01.2025.
//

import Foundation


enum BreathPurpose: Codable, CaseIterable {
    case calm
    case focus
    case relaxation
    case anxietyRelief
    case energy
}

enum BreathStage: Codable, CaseIterable {
    case inhale
    case hold
    case exhale
}

enum BreathName: String, Codable, CaseIterable {
    case fourSevenEight = "4-7-8"
}
