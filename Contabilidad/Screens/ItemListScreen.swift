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
        NavigationView {
            VStack {
                List(store.items) { item in
                    NavigationLink(destination: ItemDetailScreen(), tag: item.id, selection: self.$store.selectedItemId) {
                        ItemRow(item: item)
                    }
                }
                TotalRow(items: store.items)
            }.navigationBarTitle("Contabilidad")
        }.alert(isPresented: $store.alert.visible) {
            Alert(title: Text(store.alert.title), message: nil, dismissButton: .default(Text("OK")))
        }
    }
}

struct ItemListScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group() {
            ForEach(DEVICES_FIXTURE, id: \.self) { deviceName in
                ForEach(SCHEMES_FIXTURE, id: \.self) { scheme in
                    ItemListScreen()
                        .environmentObject(STORE_ITEMS_SCREEN_FIXTURE)
                        .previewDevice(PreviewDevice(rawValue: deviceName))
                        .environment(\.colorScheme, scheme)
                     	.previewDisplayName("\(deviceName) \(scheme)")
                }
            }
        }
    }
}
