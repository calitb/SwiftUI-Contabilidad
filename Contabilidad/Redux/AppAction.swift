//
//  AppAction.swift
//  Contabilidad
//
//  Created by Carlos Thurber Boaventura on 07Mar20.
//  Copyright © 2020 Carlos Thurber Boaventura. All rights reserved.
//

import Foundation

enum AppAction {
    // Simple Actions
    case _showSnackbar(_ conf: SnackbarConfiguration)
    case _hideSnackbar
    case _setItem(_ item: Item, amount: Double)
    
    // Thunk Actions
    case showSnackbar(_ conf: SnackbarConfiguration)
    case setItem(_ item: Item, amount: Double)
    case setSnackbarError(message: String)
    case setSnackbarSuccess(message: String)
    
    // handler for Thunk actions
    func perform(store: AppStore) -> AppAction? {
        switch self {
        case .setItem(let item, let amount):
            let action = AppAction._setItem(item, amount: amount)
            store.dispatch(action)
            if FileManagement.saveData(dataSource: store.state.items) {
                let action = AppAction.setSnackbarSuccess(message: "Saved")
                store.dispatch(action)
            }
            else {
                let action = AppAction.setSnackbarError(message: "Failed to save")
                store.dispatch(action)
            }
        case .setSnackbarError(let message):
            let action = AppAction.showSnackbar(SnackbarConfiguration(message: message, type: .error))
            store.dispatch(action)
        case .setSnackbarSuccess(let message):
            let action = AppAction._showSnackbar(SnackbarConfiguration(message: message, type: .success))
            store.dispatch(action)
        case .showSnackbar(let conf):
            let action = AppAction._showSnackbar(conf)
            store.dispatch(action)

            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                store.dispatch(AppAction._hideSnackbar)
            }
        default:
            return self
        }
        
        return nil
    }
}
