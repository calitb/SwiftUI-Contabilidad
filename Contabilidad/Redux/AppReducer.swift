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
    case .setItem(let item, let amount):
        let itemIndex = oldState.items.firstIndex(where: { $0.id == item.id })!
        state.items[itemIndex].amount = amount
        
        if FileManagement.saveData(dataSource: state.items) {
            state.snackbarConf = SnackbarConfiguration(message: "Saved", type: .success)
        }
        else {
            state.snackbarConf = SnackbarConfiguration(message: "An Error Occurred", type: .error)
        }
    case .setSnackbarError(let message):
        state.snackbarConf = SnackbarConfiguration(message: message, type: .error)
    case .setSnackbarSuccess(let message):
    	state.snackbarConf = SnackbarConfiguration(message: message, type: .success)
    case .hideSnackbar:
        state.snackbarConf = nil
    }
    
    return state
}
