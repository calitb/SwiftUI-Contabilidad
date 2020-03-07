//
//  AppReducer.swift
//  Contabilidad
//
//  Created by Carlos Thurber Boaventura on 07Mar20.
//  Copyright © 2020 Carlos Thurber Boaventura. All rights reserved.
//

import Foundation

func appReducer(state oldState: AppState, action: AppAction) -> AppState {
    var state = oldState
    
    switch (action) {
    case .updateItemAmount(let itemId, let amount):
        if let itemId = itemId {
            let itemIndex = oldState.items.firstIndex(where: { $0.id == itemId })!
            state.items[itemIndex].amount = amount
        }
    }
    
    return state
}
