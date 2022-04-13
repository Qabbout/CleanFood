//
//  APIService.swift
//  CleanFood
//
//  Created by Abdulrahman on 4/13/22.
//

import Foundation
import Alamofire

struct APIService {
    public static let shared = APIService()
    static let basURLSting = "https://6256c267e07d2c9a670c4011.mockapi.io/"
    private init() { }

    func getCategories() -> Categories? {
        var categories: Categories?
        let request = AF.request(APIService.basURLSting + "categories")
        request.validate().responseDecodable(of: Categories.self) { response in
            guard let catgs = response.value else { return }
            categories = catgs
        }
        return categories
    }

    func getItems(categoryId: String) -> Items? {
        var items: Items?
        let request = AF.request("\(APIService.basURLSting)categories/\(categoryId)/items")
        request.responseDecodable(of: Items.self) { response in
            guard let elements = response.value else { return }
            items = elements
        }
        return items
    }


}

