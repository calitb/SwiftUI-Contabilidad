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
    func perform(dispatch: @escaping Dispatch, state: AppState) -> AppAction? {
        switch self {
        case .setItem(let item, let amount):
            let action = AppAction._setItem(item, amount: amount)
            let newState = dispatch(action)
            if FileManagement.saveData(dataSource: newState.items) {
                let action = AppAction.setSnackbarSuccess(message: "Saved")
                _ = dispatch(action)
            }
            else {
                let action = AppAction.setSnackbarError(message: "Update couldn't be saved")
                _ = dispatch(action)
            }
        case .setSnackbarError(let message):
            let action = AppAction.showSnackbar(SnackbarConfiguration(message: message, type: .error))
            _ = dispatch(action)
        case .setSnackbarSuccess(let message):
            let action = AppAction._showSnackbar(SnackbarConfiguration(message: message, type: .success))
            _ = dispatch(action)
        case .showSnackbar(let conf):
            let action = AppAction._showSnackbar(conf)
            _ = dispatch(action)

            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                _ = dispatch(AppAction._hideSnackbar)
            }
        default:
            return self
        }
        
        return nil
    }
}
