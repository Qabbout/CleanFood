//
//  CartInteractor.swift
//  CleanFood
//
//  Created by Abdulrahman on 4/19/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit



class CartInteractor: CartInteractorConfiguration, CartDataStore {
    var items: Items?

    var presenter: CartPresenterConfiguration?
    let worker: CartWorker = CartWorker()


        // MARK: Do something (and send response to HomePresenter)


}
