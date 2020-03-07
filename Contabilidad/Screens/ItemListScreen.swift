//
//  ContentView.swift
//  Contabilidad
//
//  Created by Carlos Thurber Boaventura on 03Mar20.
//  Copyright © 2020 Carlos Thurber Boaventura. All rights reserved.
//

import SwiftUI

struct ItemListScreen: View {
    @EnvironmentObject private var appStore: AppStore
    
    init() {
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    List(appStore.state.items) { item in
                        NavigationLink(destination: ItemDetailScreen(item: item)) {
                            ItemRow(item: item)
                        }
                    }
                    TotalRow(items: appStore.state.items)
                }.navigationBarTitle("Contabilidad")
            }
            Snackbar(data: self.appStore.state.snackbar)
        }
    }
}

struct ItemListScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group() {
            ForEach(DEVICES_FIXTURE, id: \.self) { deviceName in
                ForEach(SCHEMES_FIXTURE, id: \.self) { scheme in
                    ItemListScreen()
                        .environmentObject(APPSTORE_ITEM_SCREEN_FIXTURE)
                        .previewDevice(PreviewDevice(rawValue: deviceName))
                        .environment(\.colorScheme, scheme)
                     	.previewDisplayName("\(deviceName) \(scheme)")
                }
            }
        }
    }
}
