//
//  DetailRow.swift
//  Contabilidad
//
//  Created by Carlos Thurber Boaventura on 05Mar20.
//  Copyright © 2020 Carlos Thurber Boaventura. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    var item: Item
    var body: some View {
        HStack() {
            CircleImage(image: item.image)
            Text(item.title)
                .font(.headline)
            Spacer()
            Text(item.amountString)
                .font(.headline)
                .foregroundColor(item.amount >= 0 ? .green : .red)
        }
    }
}

struct DetailRow_Previews: PreviewProvider {
    static var previews: some View {
        Group() {
            ForEach(DEVICES_FIXTURE, id: \.self) { deviceName in
                ForEach(SCHEMES_FIXTURE, id: \.self) { scheme in
                    NavigationView {
                        ItemRow(item: ITEM_FIXTURE)
                    }
                    .previewDevice(PreviewDevice(rawValue: deviceName))
                    .environment(\.colorScheme, scheme)
                    .previewDisplayName("\(deviceName) \(scheme)")
                }
            }
        }
    }
}
