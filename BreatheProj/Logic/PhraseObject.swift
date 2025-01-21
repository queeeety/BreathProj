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
    
    init(_ phrase: String, startTime: Int){
        self.phrase = phrase
        self.startTime = startTime
        self.duration = phrase.count % 16
    }
}
