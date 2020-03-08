//
//  App.swift
//  Contabilidad
//
//  Created by Carlos Thurber Boaventura on 08Mar20.
//  Copyright © 2020 Carlos Thurber Boaventura. All rights reserved.
//

import SwiftUI

struct App: View {
    @EnvironmentObject private var appStore: AppStore
    
    var body: some View {
        ZStack {
            NavigationView {
                ItemListScreen()
            }
            Snackbar(data: self.appStore.state.snackbar)
        }
    }
}

struct App_Previews: PreviewProvider {
    static var previews: some View {
        Group() {
            ForEach(DEVICES_FIXTURE, id: \.self) { deviceName in
                ForEach(SCHEMES_FIXTURE, id: \.self) { scheme in
                    App()
                        .environmentObject(APPSTORE_SNACKBAR_SUCCESS_FIXTURE)
                        .previewDevice(PreviewDevice(rawValue: deviceName))
                        .environment(\.colorScheme, scheme)
                        .previewDisplayName("\(deviceName) \(scheme)")
                }
            }
        }
    }
}
