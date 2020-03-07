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
    @Binding var item : Item?
    @State var amount: String = ""
    
    var body: some View {
        VStack(alignment: .center) {
            TextField("Enter the value", text: $amount)
                .padding(.all)
                .font(.title)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer()
        }
        .onAppear {
            self.amount = "\(self.item?.amount ?? 0.00)"
        }
        .navigationBarTitle(Text(self.item?.title ?? ""), displayMode: .inline)
        .navigationBarItems(trailing:
            Button("Save") {
                let action = AppAction.updateItemAmount(itemId: self.item?.id, amount: Double(self.amount)!)
                self.appStore.dispatch(action: action)
                self.item = nil
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
                        ItemDetailScreen(item: .constant(ITEM_FIXTURE))
                    }
                    .environmentObject(APPSTORE_ITEM_SCREEN_FIXTURE)
                    .previewDevice(PreviewDevice(rawValue: deviceName))
                    .environment(\.colorScheme, scheme)
                    .previewDisplayName("\(deviceName) \(scheme)")
                }
            }
        }
    }
}
