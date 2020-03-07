//
//  AppAction.swift
//  Contabilidad
//
//  Created by Carlos Thurber Boaventura on 07Mar20.
//  Copyright © 2020 Carlos Thurber Boaventura. All rights reserved.
//

import Foundation

enum AppAction {
    case setItem(_ item: Item, amount: Double)
    case hideSnackbar
    case setSnackbarError(message: String)
    case setSnackbarSuccess(message: String)
}
