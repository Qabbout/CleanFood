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

    func getCategories(completion: @escaping (Categories) -> Void) {
        let request = AF.request("\(APIService.basURLSting)categories")
        request.validate().responseDecodable(of: Categories.self) { response in
            guard let categories = response.value else { return }
            completion(categories)
        }
    }

    func getItems(categoryId: String, completion: @escaping (Items) -> Void) {

        let request = AF.request("\(APIService.basURLSting)categories/\(categoryId)/items")
        request.validate().responseDecodable(of: Items.self) { response in
            guard let items = response.value else { return }
            completion(items)
        }

    }


}

