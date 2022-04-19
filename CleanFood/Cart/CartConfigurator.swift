//
//  CartConfigurator.swift
//  CleanFood
//
//  Created by Abdulrahman on 4/19/22.
//


import UIKit


    // View Controller -> Interactor
protocol CartInteractorConfiguration {
//    func workerGetCategories(request: Home.RequestCategories)
//    func workerGetItemsOfACategory(request: Home.RequestItemsOfACategory)

}


    // Interactor -> Presenter
protocol CartPresenterConfiguration {
//    func presentCategories(response: Home.ResponseCategories)
//    func presentItemsOfACategory(response: Home.ResponseItemsOfACategory)
}

    // Presentor -> View Controller
protocol CartDisplayConfiguration: AnyObject {
//    func displayCategories(viewModel: Home.ViewModelCategories)
//    func displayItemsOfACategory(viewModel: Home.ViewModelItemsOfACategory)

}

    // Interactor -> Worker
protocol CartWorkerConfiguration {
//    func doSomeWork()
}


    // View Controller -> Route
protocol CartRoutingConfiguration {
        //    func routeToCart()
}

protocol CartDataPassing {
    var dataStore: CartDataStore? { get }
}

    // Data Store of Route
protocol CartDataStore {
    var items: Items? { get }
}



class CartConfigurator {

    static let shared = CartConfigurator()

    private init() { }

    func configure(viewController: CartViewController)
    {
    let router = CartRouter()
    router.viewController = viewController

    let presenter = CartPresenter()
    presenter.viewController = viewController

    let interactor = CartInteractor()
    interactor.presenter = presenter

    router.dataStore = interactor

    viewController.interactor = interactor
    viewController.router = router
    }
}
