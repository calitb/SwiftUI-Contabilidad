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
        case .error: return Color(red: 211/255.0, green: 47/255.0, blue: 47/255.0)
        case .success: return Color(red: 67/255.0, green: 160/255.0, blue: 71/255.0)
        }
    }
    
    var image: Image {
        switch type {
        case .error: return Image(uiImage: #imageLiteral(resourceName: "error"))
        case .success: return Image(uiImage: #imageLiteral(resourceName: "success"))
        }
    }
    
}

struct Snackbar: View {
    let HEIGHT: CGFloat = 60
    var conf: SnackbarConfiguration?
    
    var body: some View {
        VStack {
            Spacer()
            if self.conf != nil {
                HStack {
                    self.conf!.image
                        .resizable()
                        .frame(width: 30, height: 30)
                        .colorMultiply(.white)
                        .padding(.leading, 20)
                        .padding(.trailing, 10)
                    Text(self.conf!.message)
                        .font(.headline)
                        .lineLimit(2)
                        .padding(.trailing, 10)
                    Spacer()
                }
                
                .frame(height: HEIGHT)
                .background(self.conf!.color)
                .padding(.bottom, 25)
                .padding(.horizontal, 15)
                .transition(.asymmetric(
                    insertion: .move(edge: .bottom),
                    removal: .move(edge: .bottom))
                )
                .animation(Animation.spring())
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct Snackbar_Previews: PreviewProvider {
    static var previews: some View {
        Group() {
            ForEach(DEVICES_FIXTURE, id: \.self) { deviceName in
            ForEach(SCHEMES_FIXTURE, id: \.self) { scheme in
            ForEach(SCHEMES_LOCALE, id: \.self) { locale in
            ForEach(SNACKBAR_TYPES_FIXTURE, id: \.type) { type in
                NavigationView {
                    Snackbar(conf: type)
                }
                .environment(\.locale, .init(identifier: locale))
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .environment(\.colorScheme, scheme)
                .previewDisplayName("\(deviceName) \(scheme) (\(locale))")
            }}}}
        }
    }
}
