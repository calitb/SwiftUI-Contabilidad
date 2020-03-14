//
//  state.swift
//  Contabilidad
//
//  Created by Carlos Thurber Boaventura on 07Mar20.
//  Copyright © 2020 Carlos Thurber Boaventura. All rights reserved.
//

import Foundation

struct AppState {
    
    var goal: Double
    var items: [Item]
    var snackbarConf: SnackbarConfiguration?
    
    init(items: [Item]?) {
        self.init(items: items, snackbarConf: nil)
    }
    
    init(items: [Item]?, snackbarConf: SnackbarConfiguration?) {
        self.goal = 1500
        self.snackbarConf = snackbarConf;
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
