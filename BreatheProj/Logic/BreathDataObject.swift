//
//  BreathDataObject.swift
//  BreatheProj
//
//  Created by Tymofii Bezverkhyi on 22.01.2025.
//

import Foundation

class BreathDataObject: Codable, Identifiable {
    let id: UUID
    let duration: TimeInterval
    let breathName: BreathName
    let type: BreathPurpose
    let repeats: Int 
    let wasFinished: Bool
    let date: Date
    
    init(startTime: Date,
         finishTime: Date,
         breathName: BreathName,
         type: BreathPurpose,
         repeats: Int,
         wasFinished: Bool = false
    ) {
        self.id = UUID()
        
        self.duration = finishTime.timeIntervalSince(startTime)
        self.breathName = breathName
        self.type = type
        self.repeats = repeats
        self.wasFinished = wasFinished
        
        self.date = finishTime
    }
}

