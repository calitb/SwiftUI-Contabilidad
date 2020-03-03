//
//  Detail.swift
//  Contabilidad
//
//  Created by Carlos Thurber Boaventura on 04Mar20.
//  Copyright © 2020 Carlos Thurber Boaventura. All rights reserved.
//

import SwiftUI

public struct Item: Identifiable, Codable, Hashable {
    public var id: UUID
    public var title: String
    public var amount: Double
    public var imageName: String
    
    public init(id: UUID, title: String, amount: Double, imageName: String) {
        self.id = id
        self.title = title
        self.amount = amount
        self.imageName = imageName
    }
    
    var image: Image {
        Image(uiImage: #imageLiteral(resourceName: imageName))
    }
    
    var amountString: String {
        return Item.amountToString(amount: amount)
    }
    
    static let currencyFormatter: NumberFormatter = {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale.current
        return currencyFormatter
    }()
    
    public static func amountToString(amount: Double) -> String {
        return Item.currencyFormatter.string(from: NSNumber(value: amount))!
    }
}
