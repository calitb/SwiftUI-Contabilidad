//
//  reducer.swift
//  Contabilidad
//
//  Created by Carlos Thurber Boaventura on 07Mar20.
//  Copyright © 2020 Carlos Thurber Boaventura. All rights reserved.
//

import Foundation

func reducer(action _action: Action, state oldState: AppState) -> AppState {
    var state = oldState
    
    switch _action {
    case let action as ShowSnackbarAction:
        state.snackbarConf = action.conf
    case _ as HideSnackbarAction:
        state.snackbarConf = nil
    case let action as SetItemAction:
        let itemIndex = oldState.items.firstIndex(where: { $0.id == action.item.id })!
        state.items[itemIndex] = action.item
    case let action as RollbackAction:
        state = action.oldState
    default:
        NSLog("Failed to dispatch \(_action.type())")
        break
    }

    return state
}
