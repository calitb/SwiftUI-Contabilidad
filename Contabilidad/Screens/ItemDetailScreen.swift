//
//  ExpenseDetail.swift
//  Contabilidad
//
//  Created by Carlos Thurber Boaventura on 04Mar20.
//  Copyright © 2020 Carlos Thurber Boaventura. All rights reserved.
//

import SwiftUI

struct ItemDetailScreen: View {
    
    @EnvironmentObject private var store: Store
    @State var amount: String = ""
    
    var dataIndex: Int {
        store.items.firstIndex(where: { $0.id == self.store.selectedItem?.id })!
    }
    
    var body: some View {
        VStack(alignment: .center) {
            TextField("Enter the value", text: $amount)
                .padding(.all)
                .font(.title)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer()
        }.onAppear {
            self.amount = "\(self.store.selectedItem!.amount)"
        }
        .navigationBarTitle(Text(self.store.selectedItem?.title ?? ""), displayMode: .inline)
        .navigationBarItems(trailing:
            Button("Save") {
                self.store.items[self.dataIndex].amount = Double(self.amount)!
            }
        )
    }
}

struct ItemDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group() {
            ForEach(DEVICES_FIXTURE, id: \.self) { deviceName in
                ForEach(SCHEMES_FIXTURE, id: \.self) { scheme in
                    NavigationView {
                        ItemDetailScreen()
                    }
                    .environmentObject(STORE_ITEM_SCREEN_FIXTURE)
                    .previewDevice(PreviewDevice(rawValue: deviceName))
                    .environment(\.colorScheme, scheme)
                    .previewDisplayName("\(deviceName) \(scheme)")
                }
            }
        }
    }
}
