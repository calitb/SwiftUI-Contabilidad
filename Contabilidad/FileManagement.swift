//
//  fileManagement.swift
//  Contabilidad
//
//  Created by Carlos Thurber Boaventura on 06Mar20.
//  Copyright © 2020 Carlos Thurber Boaventura. All rights reserved.
//

import Foundation

final class FileManagement {
    class func filePath() -> URL {
        let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        var pathURL = URL(fileURLWithPath: documentDirectory[0])
        pathURL.appendPathComponent("items")
        return pathURL
    }
    
    class func readData() -> [Item]? {
//        #if !targetEnvironment(simulator)
        do {
            let jsonData = try Data(contentsOf: FileManagement.filePath())
            let dataSource = try JSONDecoder().decode([Item].self, from: jsonData)
            NSLog("Read data")
            return dataSource
        }
        catch {
            NSLog("Failed to read data \(error)")
        }
//        #endif
        
        return nil
    }
    
    class func saveData(dataSource: [Item]) -> Bool {
//        #if !targetEnvironment(simulator)
        do {
            let jsonData = try JSONEncoder().encode(dataSource)
            try jsonData.write(to: FileManagement.filePath())
            NSLog("Saved data")
            return true
        }
        catch {
            NSLog("Failed to save data \(error)")
        }
//        #endif
        
        return false
    }
}
