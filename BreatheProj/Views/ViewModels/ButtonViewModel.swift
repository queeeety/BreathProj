//
//  ButtonViewModel.swift
//  BreatheProj
//
//  Created by Tymofii Bezverkhyi on 22.01.2025.
//

import Foundation
import SwiftUI

@MainActor
class ButtonViewModel: ObservableObject {
    @Published var breathObject: BreathObject
    
    @Published var status: BreathStage = .notStarted
    
    private var task: Task<Void, Never>?
    
    @Published var repsCount: Int = 0
    @Published var totalReps: Int = 0

    @Published var descriptionText: String = ""
    @Published var mainText: String = ""
    @Published var instructionText: String = ""
//    @Published var reverseCounter: Int = 0
    
    @Published var totalTime: TimeInterval
    
    
    init(_ breathObject: BreathObject) {
        self.breathObject = breathObject
        
        self.totalReps = 5
        self.repsCount = 0
        self.totalTime = 0.0
        
        self.task = nil
        
    }
    
    func reset() {
        withAnimation {
            self.repsCount = 0
            self.totalTime = 0.0
            self.mainText = globalBreathPurposes[breathObject.mainPurpose]!
            self.descriptionText = globalBreathObjectsNames[breathObject.name]!
            self.status = .notStarted
            
        }
    }
    
    func changeBreathObject(_ newBreathObject: BreathObject, repsCount: Int) {
        self.breathObject = newBreathObject
        self.reset()

    }
    
    func changeTotalRepsButton() {
        if totalReps == -1 {
            totalReps = 5
        } else {
            totalReps = -1
        }
    }
    
    func start() async {
        withAnimation{
            self.status = .instructions
        }
        self.showInstructions()
        if let task = self.task {
            await task.value
        }
        self.task = nil
        
        
    }
    
    private func showInstructions() {
        task = Task {
            let phrases = breathObject.instructions
            for phrase in phrases {
                withAnimation{
                    self.descriptionText = phrase.phrase
                }
                try? await Task.sleep(nanoseconds: UInt64((phrase.duration * 1_000_000_000)))
            }
            withAnimation {
                self.descriptionText = ""
            }
            self.status = .inhale
        }
    }
    
    func stop() {
        self.status = .notStarted
        self.task = nil
        
    }
}
