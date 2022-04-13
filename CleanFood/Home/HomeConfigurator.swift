//
//  HomeConfigurator.swift
//  CleanFood
//
//  Created by Abdulrahman on 4/13/22.
//

import UIKit


// View Controller -> Interactor
protocol HomeInteractorConfiguration {
    func doSomething(request: Home.Request)

}


// Interactor -> Presenter
protocol HomePresenterConfiguration {
    func presentSomething(response: Home.Response)
}

// Presentor -> View Controller
protocol HomeDisplayConfiguration: AnyObject {
    func displaySomething(viewModel: Home.ViewModel)

}   

// Interactor -> Worker
protocol HomeWorkerConfiguration {
    func doSomeWork()
}




// View Controller -> Route
protocol HomeRoutingConfiguration {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol HomeDataPassing {
    var dataStore: HomeDataStore? { get }
}

// Data Store of Route
protocol HomeDataStore {
    //var name: String { get set }
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
