//
//  fixtures.swift
//  Contabilidad
//
//  Created by Carlos Thurber Boaventura on 06Mar20.
//  Copyright © 2020 Carlos Thurber Boaventura. All rights reserved.
//

import Foundation
import SwiftUI

let DEVICES_FIXTURE = ["iPhone 11"]
let SCHEMES_FIXTURE = [ColorScheme.dark]
let SCHEMES_LOCALE = ["en_US"]

let IMAGE_FIXTURE = Image(uiImage: #imageLiteral(resourceName: "bgeneral"))
let ITEM_FIXTURE = Item(id: UUID(), title: "Efectivo", amount: 34.72, imageName: "cash.png")

let ITEMS_FIXTURE = [
    Item(id:UUID(), title: "Efectivo", amount: 31.98, imageName: "cash.png"),
    Item(id:UUID(), title: "Cuenta de Ahorro", amount: 1234.56, imageName: "bgeneral.png"),
    Item(id:UUID(), title: "Visa", amount: -30.25, imageName: "bgeneral.png")
]

let SNACKBAR_ERROR_FIXTURE = SnackbarConfiguration(message: "An Error Occurred", type: .error)
let SNACKBAR_SUCCESS_FIXTURE = SnackbarConfiguration(message: "Success", type: .success)
let SNACKBAR_TYPES_FIXTURE = [SNACKBAR_ERROR_FIXTURE, SNACKBAR_SUCCESS_FIXTURE]

let STORE_FIXTURE = Store(state: AppState(items: ITEMS_FIXTURE, snackbarConf:nil))
let STORE_SNACKBAR_SUCCESS_FIXTURE = Store(state: AppState(items: ITEMS_FIXTURE, snackbarConf:SNACKBAR_SUCCESS_FIXTURE))
