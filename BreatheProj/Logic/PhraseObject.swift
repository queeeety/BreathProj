//
//  PhraseObject.swift
//  BreatheProj
//
//  Created by Tymofii Bezverkhyi on 21.01.2025.
//

import Foundation

class PhraseObject: Codable {
    let phrase: String
    let duration: Int
    let startTime: Int
    let stage: BreathStage?
    let type: BreathPurpose?
    
    
    init(_ phrase: String, startTime: Int){
        self.phrase = phrase
        self.startTime = startTime
        self.duration = min(phrase.count % 16, 2)
        
        self.stage = nil
        self.type = nil
    }
    
    init(type: BreathPurpose, startTime: Int){
        self.phrase = "RandomType"
        self.type = type
        self.startTime = startTime
        self.duration = 3
        
        self.stage = nil
    }

    init(stage: BreathStage, startTime: Int){
        self.phrase = "RandomStage"
        self.stage = stage
        self.startTime = startTime
        self.duration = 3
        
        self.type = nil
    }
    
}
