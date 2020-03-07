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

struct SnackbarData {
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
    var data: SnackbarData?
    
    var body: some View {
        VStack {
            if self.data != nil {
                Spacer()
                HStack {
                    Spacer()
                    Text(self.data!.message)
                        .font(.body)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    	.padding(.leading, 30)
                    Spacer()
                }.frame(height: 60).background(self.data!.color)
        	}
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
                            Snackbar(data: type)
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
