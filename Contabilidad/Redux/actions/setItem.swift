//
//  setItem.swift
//  Contabilidad
//
//  Created by Carlos Thurber Boaventura on 13Mar20.
//  Copyright © 2020 Carlos Thurber Boaventura. All rights reserved.
//

import Foundation

struct SetItemAction: Action {
    var item: Item
}

struct SetItemAmountAction: ThunkAction {
    var item: Item
    var amount: Double
    
    func perform(dispatch: @escaping Dispatch, getState: GetState) {
        var updatedItem = self.item
        updatedItem.amount = amount
        
        let rollback = RollbackAction(oldState: getState())
        dispatch(SetItemAction(item: updatedItem))
        dispatch(SaveItemsAction(rollbackAction: rollback))
    }
}

struct SaveItemsAction: ThunkAction {
    var rollbackAction: RollbackAction?
    
    func perform(dispatch: @escaping Dispatch, getState: GetState) {
        if FileManagement.saveData(dataSource: getState().items) {
            dispatch(SetSnackbarSuccessAction(message: "Saved"))
        }
        else {
            if let rollbackAction = rollbackAction {
                dispatch(rollbackAction)
            }
            dispatch(SetSnackbarErrorAction(message: "Failed to save"))
        }
    }
}
