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
    var selectedItem: Item? {
        self.items.first(where: { $0.id == self.selectedItemId})
    }
    var selectedItemIndex: Int {
        self.items.firstIndex(where: { $0.id == self.selectedItemId })!
    }
    
    @Published var selectedItemId: UUID?
    @Published var alert: StoreAlert
    @Published var items: [Item] {
        didSet {
            if FileManagement.saveData(dataSource: self.items) {
                self.selectedItemId = nil
            }
            else {
                self.alert = StoreAlert(title: "Failed to Save")
            }
        }
    }
    
    convenience init() {
        self.init(items: nil, selectedItemId:nil, alertVisible: false, alertTitle: "")
    }
    
    init(items: [Item]?, selectedItemId: UUID?, alertVisible: Bool, alertTitle: String) {
        self.alert = StoreAlert(visible: alertVisible, title: alertTitle)
        
        if let items = items {
            self.items = items
        }
        else if let savedDtems = FileManagement.readData() {
            self.items = savedDtems
        }
        else {
         	self.items = []
        }
        
        self.selectedItemId = selectedItemId
    }
    
    func setSelectedItemAmount(_ amount:Double) {
        self.items[self.selectedItemIndex].amount = amount
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


