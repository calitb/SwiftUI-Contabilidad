//
//  CircularProgressView.swift
//  Contabilidad
//
//  Created by Carlos Thurber Boaventura on 14Mar20.
//  Copyright © 2020 Carlos Thurber Boaventura. All rights reserved.
//

import SwiftUI

// based on https://github.com/Zi0P4tch0/Swift-UI-Views#circular-progress

struct CircularProgressView: View {

    var progress: CGFloat

    private let linearGradient: LinearGradient

    init(progress: CGFloat, colors: [Color] = [.purple, .green, .blue, .red]) {
        self.progress = progress
        linearGradient =  LinearGradient(gradient: Gradient(colors: colors),
                                        startPoint: .trailing,
                                        endPoint: .leading)
    }

    private var displayedProgress: String {
        let value = Int(roundf(Float(progress) * 100))
        return "\(value)%"
    }

    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: progress)
                .stroke(linearGradient, lineWidth: 25)
                .frame(width:150)
                .rotationEffect(Angle(degrees:-90))
            Text(verbatim: displayedProgress)
                .foregroundColor(.white)
                .font(.system(.largeTitle, design: .monospaced))
                .bold()
        }
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        Group() {
            ForEach(DEVICES_FIXTURE, id: \.self) { deviceName in
            ForEach(SCHEMES_FIXTURE, id: \.self) { scheme in
            ForEach(SCHEMES_LOCALE, id: \.self) { locale in
                NavigationView {
                    CircularProgressView(progress: 75/100)
                }
                .environment(\.locale, .init(identifier: locale))
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .environment(\.colorScheme, scheme)
                .previewDisplayName("\(deviceName) \(scheme) (\(locale))")
            }}}
        }
    }
}
