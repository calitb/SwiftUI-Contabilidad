//
//  Snackbar.swift
//  Contabilidad
//
//  Created by Carlos Thurber Boaventura on 08Mar20.
//  Copyright © 2020 Carlos Thurber Boaventura. All rights reserved.
//

import SwiftUI

enum SnackbarType {
    case error
    case success
}

struct SnackbarConfiguration {
    var message: String
    var type: SnackbarType
    
    var color: Color {
        switch type {
            case .error: return .red
            case .success: return .green
        }
    }
}

struct Snackbar: View {
    let HEIGHT: CGFloat = 60
    var conf: SnackbarConfiguration
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text(self.conf.message)
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 30)
                Spacer()
            }.frame(height: HEIGHT)
            .background(self.conf.color)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct Snackbar_Previews: PreviewProvider {
    static var previews: some View {
        Group() {
            ForEach(DEVICES_FIXTURE, id: \.self) { deviceName in
                ForEach(SCHEMES_FIXTURE, id: \.self) { scheme in
                    ForEach(SNACKBAR_TYPES_FIXTURE, id: \.type) { type in
                        NavigationView {
                            Snackbar(conf: type)
                        }
                        .previewDevice(PreviewDevice(rawValue: deviceName))
                        .environment(\.colorScheme, scheme)
                        .previewDisplayName("\(deviceName) \(scheme)")
                    }
                }
            }
        }
    }
}
