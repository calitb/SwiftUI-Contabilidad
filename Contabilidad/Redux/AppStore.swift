//
//  AppStore.swift
//  Contabilidad
//
//  Created by Carlos Thurber Boaventura on 07Mar20.
//  Copyright © 2020 Carlos Thurber Boaventura. All rights reserved.
//

import Foundation
import SwiftUI

final class AppStore: ObservableObject {
    @Published private(set) var state: AppState {
        didSet {
            if state.snackbarConf != nil {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    let action = AppAction.hideSnackbar
                    self.dispatch(action: action)
                }
            }
        }
    }
    
    convenience init() {
        self.init(state: AppState(items: []))
    }
    
    init(state: AppState) {
        self.state = state
    }
    
    public func dispatch(action: AppAction) {
        state = appReducer(state: state, action: action)
    }
}
