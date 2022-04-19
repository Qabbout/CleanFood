//
//  HomeConfigurator.swift
//  CleanFood
//
//  Created by Abdulrahman on 4/13/22.
//

import UIKit


// View Controller -> Interactor
protocol HomeInteractorConfiguration {
    func workerGetCategories(request: Home.RequestCategories)
    func workerGetItemsOfACategory(request: Home.RequestItemsOfACategory)

}


// Interactor -> Presenter
protocol HomePresenterConfiguration {
    func presentCategories(response: Home.ResponseCategories)
    func presentItemsOfACategory(response: Home.ResponseItemsOfACategory)
}

// Presentor -> View Controller
protocol HomeDisplayConfiguration: AnyObject {
    func displayCategories(viewModel: Home.ViewModelCategories)
    func displayItemsOfACategory(viewModel: Home.ViewModelItemsOfACategory)

}

// Interactor -> Worker
protocol HomeWorkerConfiguration {
    func getCategories(completion: @escaping (Home.ResponseCategories) -> Void)
    func getItemsOfACategory(request: Home.RequestItemsOfACategory, completion: @escaping (Home.ResponseItemsOfACategory) -> Void)
}


// View Controller -> Route
protocol HomeRoutingConfiguration {
    func routeToCart()
}

protocol HomeDataPassing {
    var dataStore: HomeDataStore? { get set}
}

// Data Store of Route
protocol HomeDataStore {
    var items: Items? { get set}
}



class HomeConfigurator {

    static let shared = HomeConfigurator()

    private init() { }

    func configure(viewController: HomeViewController)
    {
        let router = HomeRouter()
        router.viewController = viewController

        let presenter = HomePresenter()
        presenter.viewController = viewController

        let interactor = HomeInteractor()
        interactor.presenter = presenter

        router.dataStore = interactor

        viewController.interactor = interactor
        viewController.router = router
    }
}
