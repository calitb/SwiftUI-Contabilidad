//
//  AppState.swift
//  Contabilidad
//
//  Created by Carlos Thurber Boaventura on 07Mar20.
//  Copyright © 2020 Carlos Thurber Boaventura. All rights reserved.
//

import Foundation

struct AppState {
    
    var items: [Item]
    
    init(items: [Item]?) {
        
        if let savedItems = FileManagement.readData() {
            self.items = savedItems
        }
        else if let items = items {
            self.items = items
        }
        else {
            self.items = []
        }
    }
    
}
