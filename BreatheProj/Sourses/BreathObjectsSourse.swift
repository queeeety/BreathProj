//
//  BreathObjectsSourse.swift
//  BreatheProj
//
//  Created by Tymofii Bezverkhyi on 21.01.2025.
//

import Foundation

let GlobalObjects: [BreathObject] = [
    BreathObject(
        name: .fourSevenEight,
        mainPurpose: BreathPurpose.calm,
        description: [
            String(localized:"To calm down"),
            String(localized:"To reduce stress"),
            String(localized:"To sleep easier")
        ],
        instructions: [
            PhraseObject(String(localized:"Sit comfortably with a straight back"), startTime: 0),
            PhraseObject(String(localized:"your tongue should be resting against the roof of your mouth"), startTime: 2),
            PhraseObject(String(localized:"Breathe in silently through your nose for a count of four"), startTime: 4),
            PhraseObject(String(localized:"After breathing in, hold your breath for a count of seven"), startTime: 6),
            PhraseObject(String(localized:"Breathe out forcefully through your mouth"), startTime: 8),
            PhraseObject(String(localized:"try making a ‘whoosh’ sound as you let the air out"), startTime: 10),
        ],
        inhale: 4,
        hold: 7,
        exhale: 8,
        phrases: [
            PhraseObject("Inhale", startTime: 0),
            PhraseObject("Hold", startTime: 4),
            PhraseObject(stage: .hold, startTime: 6),
            PhraseObject("Exhale", startTime: 11),
            PhraseObject("Like a whoosh", startTime: 13),
            PhraseObject(stage: .exhale, startTime: 15),
        ]

    )
    
]


let globalBreathObjectsNames: [BreathName: String] = [
    .fourSevenEight: String(localized: "4-7-8")
]
    
let globalBreathPurposes: [BreathPurpose: String] = [
    .anxietyRelief: String(localized: "Anxiety relief"),
    .calm: String(localized: "Calm"),
    .relaxation: String(localized: "Relaxation"),
    .focus: String(localized: "Focus"),
    .energy: String(localized: "Energy"),
    .sleep: String(localized: "Sleep")
]
