//
//  File.swift
//  Breathe
//
//  Created by Tymofii Bezverkhyi on 21.01.2025.
//

import Foundation

class BreathObject: Codable {
    let name: String
    let mainPurpose: BreathPurpose
    let description:[String]
    let instructions: [PhraseObject]
    let inhale: Int
    let hold: Int
    let exhale: Int
    let phrases: [PhraseObject]
    
    init(name: String,
         mainPurpose: BreathPurpose,
         description: [String],
         instructions: [PhraseObject],
         inhale: Int,
         hold: Int,
         exhale: Int,
         phrases: [PhraseObject]
    ) {
        self.name = name
        self.mainPurpose = mainPurpose
        self.description = description
        self.instructions = instructions
        self.inhale = inhale
        self.hold = hold
        self.exhale = exhale
        self.phrases = phrases
    }
}
