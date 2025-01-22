//
//  File.swift
//  Breathe
//
//  Created by Tymofii Bezverkhyi on 21.01.2025.
//

import Foundation

class StorageManager {
//
//    func loadBreathObjects() -> [BreathObject]? {
//        let fileName = "breathObjects.json"
//        
//        guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: "json") else {
//            print("File not found: \(fileName).json")
//            return nil
//        }
//        
//        do {
//            let jsonData = try Data(contentsOf: fileURL)
//            let decoder = JSONDecoder()
//            let breathObjects = try decoder.decode([BreathObject].self, from: jsonData)
//            return breathObjects
//        } catch {
//            print("Error loading or decoding JSON: \(error)")
//            return nil
//        }
//    }
//    
//    func addBreathObject(_ newObject: BreathObject) {
//        
//        let fileName = "breathObjects.json"
//        
//        guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: "json") else {
//            print("File not found: \(fileName).json")
//            return
//        }
//        
//        do {
//            // Завантажуємо наявні дані
//            let jsonData = try Data(contentsOf: fileURL)
//            let decoder = JSONDecoder()
//            var breathObjects = try decoder.decode([BreathObject].self, from: jsonData)
//            
//            // Додаємо новий об'єкт
//            breathObjects.append(newObject)
//            
//            // Конвертуємо оновлений масив у JSON
//            let encoder = JSONEncoder()
//            encoder.outputFormatting = .prettyPrinted
//            let updatedJsonData = try encoder.encode(breathObjects)
//            
//            // Перезаписуємо файл
//            try updatedJsonData.write(to: fileURL)
//            print("New BreathObject added successfully.")
//        } catch {
//            print("Error updating JSON file: \(error)")
//        }
//    }
    
}
