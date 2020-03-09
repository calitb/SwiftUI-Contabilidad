//
//  AppStore.swift
//  Contabilidad
//
//  Created by Carlos Thurber Boaventura on 07Mar20.
//  Copyright © 2020 Carlos Thurber Boaventura. All rights reserved.
//

import Foundation
import SwiftUI

typealias Dispatch = (_ action: AppAction) -> AppState
final class AppStore: ObservableObject {
    @Published private(set) var state: AppState
    
    convenience init() {
        self.init(state: AppState(items: []))
    }
    
    init(state: AppState) {
        self.state = state
    }
    
    public func dispatch(action: AppAction) -> AppState {
        if let simpleAction = action.perform(dispatch: self.dispatch, state: self.state) {
            self.state = appReducer(state: state, action: simpleAction)
        }
        
        return self.state
    }
}
