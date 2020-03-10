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
    case showSnackbar(_ conf: SnackbarConfiguration)
    case hideSnackbar
    case __setItem(_ item: Item, amount: Double)
    
    // Thunk Actions
    case presentSnackbar(_ conf: SnackbarConfiguration, timeout: Double)
    case setItem(_ item: Item, amount: Double)
    case setSnackbarError(message: String)
    case setSnackbarSuccess(message: String)
    
    // handler for Thunk actions
    func perform(store: AppStore) -> AppAction? {
        switch self {
        case .setItem(let item, let amount):
            let action = AppAction.__setItem(item, amount: amount)
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
            let action = AppAction.presentSnackbar(SnackbarConfiguration(message: message, type: .error), timeout: 2.0)
            store.dispatch(action)
        case .setSnackbarSuccess(let message):
            let action = AppAction.presentSnackbar(SnackbarConfiguration(message: message, type: .success), timeout: 2.0)
            store.dispatch(action)
        case .presentSnackbar(let conf, let timeout):
            let action = AppAction.showSnackbar(conf)
            store.dispatch(action)

            DispatchQueue.main.asyncAfter(deadline: .now() + timeout) {
                store.dispatch(AppAction.hideSnackbar)
            }
        default:
            return self
        }
        
        return nil
    }
}
