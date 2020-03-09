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
    case ._setItem(let item, let amount):
        let itemIndex = oldState.items.firstIndex(where: { $0.id == item.id })!
        state.items[itemIndex].amount = amount
    case ._showSnackbar(let conf):
        state.snackbarConf = conf
    case ._hideSnackbar:
        state.snackbarConf = nil
    default:
        break
    }
    
    return state
}
