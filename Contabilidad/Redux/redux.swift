//
//  redux.swift
//  Contabilidad
//
//  Created by Carlos Thurber Boaventura on 13Mar20.
//  Copyright © 2020 Carlos Thurber Boaventura. All rights reserved.
//

import Foundation

typealias Dispatch = (_ action: ReduxAction) -> Void
typealias GetState = () -> AppState

protocol ReduxAction {
    func type() -> String
}

extension ReduxAction {
    func type() -> String {
        return String(describing: Swift.type(of: self))
    }
}

protocol Action: ReduxAction {
    
}

protocol ThunkAction: ReduxAction {
    func perform(dispatch: @escaping Dispatch, getState: GetState)
}

struct RollbackAction: Action {
    var oldState: AppState
}
