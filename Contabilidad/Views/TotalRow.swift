//
//  TotalRow.swift
//  Contabilidad
//
//  Created by Carlos Thurber Boaventura on 05Mar20.
//  Copyright © 2020 Carlos Thurber Boaventura. All rights reserved.
//

import SwiftUI

struct TotalRow: View {
    var items: [Item]
    
    var body: some View {
        HStack() {
            Text("TOTAL")
                .font(.title)
            Spacer()
            Text(Item.amountToString(amount: items.map({$0.amount}).reduce(0,+)))
                .font(.title)
        }
        .frame(height: 30)
        .padding(.leading, 10)
        .padding(.trailing, 10)
    }
}

struct TotalRow_Previews: PreviewProvider {
    static var previews: some View {
        Group() {
            ForEach(DEVICES_FIXTURE, id: \.self) { deviceName in
            ForEach(SCHEMES_FIXTURE, id: \.self) { scheme in
            ForEach(SCHEMES_LOCALE, id: \.self) { locale in
                NavigationView {
                    TotalRow(items: ITEMS_FIXTURE)
                }
                .environment(\.locale, .init(identifier: locale))
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .environment(\.colorScheme, scheme)
                .previewDisplayName("\(deviceName) \(scheme) (\(locale))")
            }}}
        }
    }
}
