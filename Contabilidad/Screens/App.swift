//
//  App.swift
//  Contabilidad
//
//  Created by Carlos Thurber Boaventura on 08Mar20.
//  Copyright © 2020 Carlos Thurber Boaventura. All rights reserved.
//

import SwiftUI

struct App: View {
    @EnvironmentObject private var store: Store
    
    var body: some View {
        ZStack {
            NavigationView {
                ItemListScreen()
            }
            Snackbar(conf: self.store.state.snackbarConf)
        }
    }
}

struct App_Previews: PreviewProvider {
    static var previews: some View {
        Group() {
            ForEach(DEVICES_FIXTURE, id: \.self) { deviceName in
            ForEach(SCHEMES_FIXTURE, id: \.self) { scheme in
            ForEach(SCHEMES_LOCALE, id: \.self) { locale in
                App()
                    .environment(\.locale, .init(identifier: locale))
                    .environmentObject(STORE_SNACKBAR_SUCCESS_FIXTURE)
                    .previewDevice(PreviewDevice(rawValue: deviceName))
                    .environment(\.colorScheme, scheme)
                    .previewDisplayName("\(deviceName) \(scheme) (\(locale))")
            }}}
        }
    }
}



