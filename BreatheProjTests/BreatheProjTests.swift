//
//  BreatheProjTests.swift
//  BreatheProjTests
//
//  Created by Tymofii Bezverkhyi on 21.01.2025.
//

import Testing
@testable import BreatheProj
import Foundation

@Suite("Saving&Getting data", .serialized)
struct SavingAndGettingDataTests {
    let fileManager = StorageManager()
    @Test("Empty file")
    func ReceivingAnEmptyFileTest() throws {
        fileManager.deleteFile()
        
        let data = fileManager.loadBreathData()
        
        #expect(data.isEmpty)
    }
    
    
    
    @Test("Encoding data", arguments: [
        [
            BreathDataObject(
            startTime: Date.now.addingTimeInterval(-1000),
            finishTime: Date.now.addingTimeInterval(-500),
            breathName: .fourSevenEight,
            type: .anxietyRelief,
            repeats: 3,
            wasFinished: true
            ),
            BreathDataObject(
            startTime: Date.now.addingTimeInterval(-500),
            finishTime: Date.now.addingTimeInterval(-200),
            breathName: .fourSevenEight,
            type: .anxietyRelief,
            repeats: 2,
            wasFinished: true
            ),
            BreathDataObject(
            startTime: Date.now.addingTimeInterval(-200),
            finishTime: Date.now,
            breathName: .fourSevenEight,
            type: .calm,
            repeats: 5,
            wasFinished: false
            )
        ],
    ])
    func EncodingDataTest(_ data: [BreathDataObject]) {
        fileManager.deleteFile()
        for i in (0..<data.count) {
            fileManager.addBreathData(data[i])
            
            let array = fileManager.loadBreathData()
            #expect(i + 1 == array.count)
            for j in 0...i {
                #expect(array[j].id == data[j].id)
            }
            
        }
        
        
    }
    
}


