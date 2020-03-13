//
//  snackbar.swift
//  Contabilidad
//
//  Created by Carlos Thurber Boaventura on 13Mar20.
//  Copyright © 2020 Carlos Thurber Boaventura. All rights reserved.
//

import Foundation

struct ShowSnackbarAction: Action {
    var conf: SnackbarConfiguration
}

struct HideSnackbarAction: Action {}

struct PresentSnackbarAction: ThunkAction {
    var conf: SnackbarConfiguration
    var timeout: Double
    
    func perform(dispatch: @escaping Dispatch, getState: GetState) {
        dispatch(ShowSnackbarAction(conf: conf))

        DispatchQueue.main.asyncAfter(deadline: .now() + timeout) {
            dispatch(HideSnackbarAction())
        }
    }
}

struct SetSnackbarErrorAction: ThunkAction {
    var message: String
    
    func perform(dispatch: @escaping Dispatch, getState: GetState) {
        dispatch(PresentSnackbarAction(conf: SnackbarConfiguration(message: message, type: .error), timeout: 2.0))
    }
}

struct SetSnackbarSuccessAction: ThunkAction {
    var message: String
    
    func perform(dispatch: @escaping Dispatch, getState: GetState) {
        dispatch(PresentSnackbarAction(conf: SnackbarConfiguration(message: message, type: .success), timeout: 2.0))
    }
}
