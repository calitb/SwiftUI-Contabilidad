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
    var amount: Double
}

struct UpdateItemAction: ThunkAction {
    var item: Item
    var amount: Double
    
    func perform(dispatch: @escaping Dispatch, getState: GetState) {
        dispatch(SetItemAction(item: item, amount: amount))
        dispatch(SaveItemsAction())
    }
}

struct SaveItemsAction: ThunkAction {
    func perform(dispatch: @escaping Dispatch, getState: GetState) {
        if FileManagement.saveData(dataSource: getState().items) {
            dispatch(SetSnackbarSuccessAction(message: "Saved"))
        }
        else {
            dispatch(SetSnackbarErrorAction(message: "Failed to save"))
        }
    }
}
