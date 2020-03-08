//
//  ExpenseDetail.swift
//  Contabilidad
//
//  Created by Carlos Thurber Boaventura on 04Mar20.
//  Copyright © 2020 Carlos Thurber Boaventura. All rights reserved.
//

import SwiftUI

struct ItemDetailScreen: View {
    
    @EnvironmentObject private var appStore: AppStore
    @State var amount: String = ""
    
    var item : Item
    
    var body: some View {
        VStack(alignment: .center) {
            TextField("Enter the value", text: $amount)
                .padding(.all)
                .font(.title)
            	.textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer()
        }
        .onAppear {
            self.amount = "\(self.item.amount)"
        }
        .navigationBarTitle(Text(self.item.title), displayMode: .inline)
        .navigationBarItems(trailing:
            Button("Save") {
                let action = AppAction.setItem(self.item, amount: Double(self.amount)!)
                self.appStore.dispatch(action: action)
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
                        ItemDetailScreen(item: ITEM_FIXTURE)
                    }
                    .environmentObject(APPSTORE_FIXTURE)
                    .previewDevice(PreviewDevice(rawValue: deviceName))
                    .environment(\.colorScheme, scheme)
                    .previewDisplayName("\(deviceName) \(scheme)")
                }
            }
        }
    }
}
