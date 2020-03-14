//
//  GoalScreen.swift
//  Contabilidad
//
//  Created by Carlos Thurber Boaventura on 14Mar20.
//  Copyright © 2020 Carlos Thurber Boaventura. All rights reserved.
//

import SwiftUI

struct GoalScreen: View {
    @EnvironmentObject private var store: Store
    
    var body: some View {
        VStack {
            CircularProgressView(progress: CGFloat(store.state.items.map({$0.amount}).reduce(0,+)/store.state.goal), colors: [.green])
            
        }.navigationBarTitle(Text("Goal"), displayMode: .inline)
    }
}

struct GoalScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group() {
            ForEach(DEVICES_FIXTURE, id: \.self) { deviceName in
            ForEach(SCHEMES_FIXTURE, id: \.self) { scheme in
            ForEach(SCHEMES_LOCALE, id: \.self) { locale in
                NavigationView {
                    GoalScreen()
                }
                .environment(\.locale, .init(identifier: locale))
                .environmentObject(STORE_FIXTURE)
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .environment(\.colorScheme, scheme)
                .previewDisplayName("\(deviceName) \(scheme) (\(locale))")
            }}}
        }
    }
}
