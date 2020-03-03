//
//  CircleImage.swift
//  Contabilidad
//
//  Created by Carlos Thurber Boaventura on 04Mar20.
//  Copyright © 2020 Carlos Thurber Boaventura. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    var body: some View {
        image.resizable()
            .frame(width: 55, height: 55)
            .clipShape(Circle())
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        Group() {
            ForEach(DEVICES_FIXTURE, id: \.self) { deviceName in
                ForEach(SCHEMES_FIXTURE, id: \.self) { scheme in
                    NavigationView {
                    	CircleImage(image: IMAGE_FIXTURE)
                    }
                    .previewDevice(PreviewDevice(rawValue: deviceName))
                    .environment(\.colorScheme, scheme)
                    .previewDisplayName("\(deviceName) \(scheme)")
                }
            }
        }
    }
}
