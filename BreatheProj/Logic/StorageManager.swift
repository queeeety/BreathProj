//
//  File.swift
//  Breathe
//
//  Created by Tymofii Bezverkhyi on 21.01.2025.
//

import Foundation

class StorageManager {
    let dataFileName = "breathData"
    
    // loading from JSON
    func loadBreathData() -> [BreathDataObject] {
        let fileManager = FileManager.default
        let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentsDirectory.appendingPathComponent("\(dataFileName).json")
        
        // checking if file exists
        if !fileManager.fileExists(atPath: fileURL.path) {
            // creating empty file
            createEmptyDataFile(at: fileURL)
        }
        
        do {
            let jsonData = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let breathDataList = try decoder.decode([BreathDataObject].self, from: jsonData)
            return breathDataList
        } catch {
            print("Error loading or decoding JSON: \(error)")
            return []
        }
    }
        
        
    private func createEmptyDataFile(at fileURL: URL) {
        do {
            let encoder = JSONEncoder()
            let emptyData = try encoder.encode([BreathDataObject]())
            try emptyData.write(to: fileURL)
            print("File created at \(fileURL.path).")
        } catch {
            print("Error creating empty file: \(error)")
        }
    }
    
    func deleteFile() {
        let fileManager = FileManager.default
        let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentsDirectory.appendingPathComponent("\(dataFileName).json")
        
        if fileManager.fileExists(atPath: fileURL.path) {
            do {
                try fileManager.removeItem(at: fileURL)
                print("File \(dataFileName).json successfully deleted.")
            } catch {
                print("Error deleting file \(dataFileName).json: \(error)")
            }
        } else {
            print("File \(dataFileName).json does not exist.")
        }
    }

    func addBreathData(_ newObject: BreathDataObject) {
        let fileManager = FileManager.default
        let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentsDirectory.appendingPathComponent("\(dataFileName).json")
        
        var breathDataList: [BreathDataObject] = loadBreathData()
        breathDataList.append(newObject)
        
        do {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let jsonData = try encoder.encode(breathDataList)
            
            try jsonData.write(to: fileURL)
            print("New BreathDataObject added and file updated successfully.")
        } catch {
            print("Error encoding or writing JSON: \(error)")
        }
    }
}
