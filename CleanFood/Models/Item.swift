//
//  Item.swift
//  CleanFood
//
//  Created by Abdulrahman on 4/13/22.
//

import Foundation

struct Item: Codable {
    let title, itemDescription, ingredients, price: String
    let image: String
    let id, categoryID: String

    enum CodingKeys: String, CodingKey {
        case title
        case itemDescription = "description"
        case ingredients, price, image, id
        case categoryID = "categoryId"
    }
}
typealias Items = [Item]
