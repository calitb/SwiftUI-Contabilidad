//
//  store.swift
//  Contabilidad
//
//  Created by Carlos Thurber Boaventura on 07Mar20.
//  Copyright © 2020 Carlos Thurber Boaventura. All rights reserved.
//

import Foundation
import SwiftUI

final class Store: ObservableObject {
    @Published private(set) var state: AppState
    
    convenience init() {
        self.init(state: AppState(items: []))
    }
    
    init(state: AppState) {
        self.state = state
    }
    
    public func dispatch(_ action: ReduxAction) {
        NSLog("Dispatching \(action.type())")
        
        if let thunkAction = action as? ThunkAction {
            thunkAction.perform(dispatch: self.dispatch, getState: self.getState)
        }
        else if let action = action as? Action {
            self.state = reducer(action: action, state: self.state)
        }
    }
    
    public func getState() -> AppState {
        let state = self.state
        return state
    }
}
