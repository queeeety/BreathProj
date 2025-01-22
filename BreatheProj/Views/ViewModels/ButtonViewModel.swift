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
    
    private var mainTask: Task<Void, Never>?
    private var timer: Timer?
    private var elapsedTime: Int = 0{
        didSet{
            withAnimation{
                updateMainTimerText()
            }
        }
    }
    
    @Published var repsCount: Int = 0
    @Published var totalReps: Int = 0

    @Published var descriptionText: String = ""
    @Published var mainText: String = ""
    @Published var instructionText: String = ""
    
    @Published var totalTime: TimeInterval
    
    @Published var hours: Int = 0
    @Published var minutes: Int = 0
    @Published var seconds: Int = 0
    
    init(_ breathObject: BreathObject) {
        self.breathObject = breathObject
        
        self.totalReps = 5
        self.repsCount = 0
        self.totalTime = 0.0
        
        self.mainTask = nil
        
    }
    
    func start() async {
        
        withAnimation{
            self.status = .instructions
        }
        
        self.showInstructions()
        
        if let task = self.mainTask {
            await task.value
        }
        self.mainTask = nil
        
        self.startTimer()
        
        // INHALE
        self.status = .inhale
        var countDown = countDownChanges(for: breathObject.inhale)
        await countDown.value
        
        countDown.cancel()
        self.status = .hold
        countDown = countDownChanges(for: breathObject.hold)
        await countDown.value
        
        self.status = .exhale
        countDown = countDownChanges(for: breathObject.exhale)
        await countDown.value
    }
    
    func stop() {
        self.status = .notStarted
        self.mainTask = nil
        self.stopTimer()
    }
    
    //MARK: - TIMER
    
    func startTimer() {
        stopTimer()
        
        elapsedTime = 0
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return } // to avoid loops we are getting link
            
            Task { @MainActor in
                self.elapsedTime += 1
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    
    //MARK: - TEXT CHANGES
    
    private func showInstructions() {
        mainTask = Task {
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
    
    private func updateMainTimerText() {
        let hours = Int(elapsedTime / 3_600)
        let minutes = Int((elapsedTime - hours * 3_600) / 60)
        let seconds = Int(elapsedTime % 60)

        if hours != self.hours {
            self.hours = hours
        }
        if self.minutes != minutes {
            self.minutes = minutes
        }
        self.seconds = seconds
    }
    
    private func countDownChanges(for seconds: Int) -> Task<Void, Never> {
        let task = Task {
            for i in stride(from: seconds, through: 0, by: -1) {
                withAnimation{
                    mainText = "\(i)"
                }
                try? await Task.sleep(nanoseconds: 1_000_000_000)
            }
            self.mainText = ""
        }
        return task
    }
    
    //MARK: - OTHERS
    
    func changeTotalRepsButton() {
        if totalReps == -1 {
            totalReps = 5
        } else {
            totalReps = -1
        }
    }
    
    func reset() {
        withAnimation {
            self.repsCount = 0
            self.totalTime = 0.0
            self.mainText = globalBreathPurposes[breathObject.mainPurpose]!
            self.descriptionText = globalBreathObjectsNames[breathObject.name]!
            self.status = .notStarted
            self.elapsedTime = 0
            self.stopTimer()

            
        }
    }
    
    func changeBreathObject(_ newBreathObject: BreathObject, repsCount: Int) {
        self.breathObject = newBreathObject
        self.reset()

    }
}
