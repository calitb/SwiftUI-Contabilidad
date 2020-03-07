//
//  Store.swift
//  Contabilidad
//
//  Created by Carlos Thurber Boaventura on 04Mar20.
//  Copyright © 2020 Carlos Thurber Boaventura. All rights reserved.
//

import SwiftUI
import Combine

final class Store: ObservableObject  {
    
    let SAVED = "Saved"
    let NOT_SAVED = "Failed to Save"
    
    @Published var selectedItem: Item?
    @Published var selectedItemId: UUID? {
        didSet {
            self.selectedItem = self.items.first(where: { $0.id == self.selectedItemId})
        }
    }
    
    @Published var alert: StoreAlert
    
    @Published var items: [Item] {
        didSet {
            if FileManagement.saveData(dataSource: self.items) {
                self.selectedItemId = nil
            }
            else {
                self.alert = StoreAlert(title: NOT_SAVED)
            }
        }
    }
    
    convenience init() {
        self.init(items: nil, selectedItem:nil, alertVisible: false, alertTitle: "")
    }
    
    init(items: [Item]?, selectedItem: Item?, alertVisible: Bool, alertTitle: String) {
        self.alert = StoreAlert(visible: alertVisible, title: alertTitle)
        self.selectedItem = selectedItem
        
        if let items = items {
            self.items = items
        }
        else if let savedDtems = FileManagement.readData() {
            self.items = savedDtems
        }
        else {
         	self.items = []
        }
    }
    
//    var changeSink: AnyCancellable?
//    var toggleSink: AnyCancellable?
//
//    init() {
//        NSLog("Model init")
//        changeSink = objectWillChange.sink { void in
//            NSLog("1 toggle \(self.dataSource)")
//        }
//        toggleSink = $dataSource.sink { v in
//            NSLog("2 toggle \(self.dataSource) -> \(v)")
//        }
//    }
}


