//
//  ContentView.swift
//  Contabilidad
//
//  Created by Carlos Thurber Boaventura on 03Mar20.
//  Copyright © 2020 Carlos Thurber Boaventura. All rights reserved.
//

import SwiftUI

struct ItemListScreen: View {
    @EnvironmentObject private var store: Store
    
    init() {
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    var body: some View {
        VStack {
            List(store.state.items) { item in
                NavigationLink(destination: ItemDetailScreen(item: item)) {
                    ItemRow(item: item)
                }
            }
            TotalRow(items: store.state.items)
        }
        .navigationBarTitle("Contabilidad")
        .navigationBarItems(trailing:
            NavigationLink(destination: GoalScreen()) {
                Text("Goal")
            }
        )
    }
}

struct ItemListScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group() {
            ForEach(DEVICES_FIXTURE, id: \.self) { deviceName in
                ForEach(SCHEMES_FIXTURE, id: \.self) { scheme in
                    NavigationView {
                        ItemListScreen()
                    }
                    .environmentObject(STORE_FIXTURE)
                    .previewDevice(PreviewDevice(rawValue: deviceName))
                    .environment(\.colorScheme, scheme)
                    .previewDisplayName("\(deviceName) \(scheme)")
                }
            }
        }
    }
}
