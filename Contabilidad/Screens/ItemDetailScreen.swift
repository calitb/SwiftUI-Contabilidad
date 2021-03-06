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
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                self.store.dispatch(SetItemAmountAction(item: self.item, amount: Double(self.amount)!))
            }
        )
    }
}

struct ItemDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group() {
            ForEach(DEVICES_FIXTURE, id: \.self) { deviceName in
            ForEach(SCHEMES_FIXTURE, id: \.self) { scheme in
            ForEach(SCHEMES_LOCALE, id: \.self) { locale in
                NavigationView {
                    ItemDetailScreen(item: ITEM_FIXTURE)
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
