//
//  ObjectCreation&Saving.swift
//  BreatheProjTests
//
//  Created by Tymofii Bezverkhyi on 21.01.2025.
//

import Testing
@testable import BreatheProj

@Suite("Object creation & saving", .serialized)
struct ObjectCreation_Saving {

    let storage = StorageManager()
    
    @Test("Load tests into json", arguments: [
        
    ])
    func loadTests(
        name: String,
        mainPurpose: BreathPurpose,
        description: [String],
        insructions: [String],
        inhale: Int,
        hold: Int,
        exhale: Int,
        phrases: (Int, [String])
    ) {
    }

}
