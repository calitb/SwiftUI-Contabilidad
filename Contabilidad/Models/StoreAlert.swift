//
//  StoreAlert.swift
//  Contabilidad
//
//  Created by Carlos Thurber Boaventura on 07Mar20.
//  Copyright © 2020 Carlos Thurber Boaventura. All rights reserved.
//

import Foundation

public struct StoreAlert {
    var visible: Bool {
        didSet {
            if self.visible {
                self.title = ""
            }
        }
    }
    var title: String
    
    public init(visible: Bool, title: String) {
        self.visible = visible
        self.title = title
    }
    
    public init(title: String) {
        self.init(visible: true, title: title)
    }
}
