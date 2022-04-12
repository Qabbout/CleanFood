//
//  HomeViewController.swift
//  CleanFood
//
//  Created by Abdulrahman on 4/11/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HomeDisplayLogic: AnyObject {
    func displaySomething(viewModel: Home.Something.ViewModel)
//    func displaySomethingElse(viewModel: Home.SomethingElse.ViewModel)
}

class HomeViewController: UICollectionViewController, HomeDisplayLogic {
    var interactor: HomeBusinessLogic?
    var router: (NSObjectProtocol & HomeRoutingLogic & HomeDataPassing)?

    private let floatingActionButton: UIButton = {
        let button = UIButton()
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 30
        button.backgroundColor = .white
        button.setImage(UIImage(systemName: "cart.fill"), for: .normal)
        button.tintColor = .black
        button.layer.shadowRadius = 2
        button.layer.shadowOpacity = 0.8
        button.layer.shadowOffset = .init(width: -3, height: 3)


        return button
    }()

    @objc func printit(){
        print("Workeeeeeeeeeeeeeeeeeeeeeeeeee")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        floatingActionButton.frame = .init(x: view.frame.width - 60 - 20, y: view.frame.height - 100, width: 60, height: 60)
    }



    // MARK: Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: - Setup Clean Code Design Pattern

    private func setup() {
        let viewController = self
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: - Routing

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }

    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(floatingActionButton)
        floatingActionButton.addTarget(self, action: #selector(printit), for: .touchUpInside)
        collectionView.contentInsetAdjustmentBehavior = .never
        doSomething()
//        doSomethingElse()
    }

    //MARK: - receive events from UI
    //@IBOutlet weak var nameTextField: UITextField!

//    @IBAction func cancelButtonTapped(_ sender: Any) {
//
//    }
//
//    @IBAction func confirmButtonTapped(_ sender: Any) {
//
//    }
//

    // MARK: - request data from HomeInteractor

    //@IBOutlet weak var nameTextField: UITextField!

    func doSomething() {
        let request = Home.Something.Request()
        interactor?.doSomething(request: request)
    }
//
//    func doSomethingElse() {
//        let request = Home.SomethingElse.Request()
//        interactor?.doSomethingElse(request: request)
//    }

    // MARK: - display view model from HomePresenter

    func displaySomething(viewModel: Home.Something.ViewModel) {
        //nameTextField.text = viewModel.name
    }
//
//    func displaySomethingElse(viewModel: Home.SomethingElse.ViewModel) {
//        // do sometingElse with viewModel
//    }
}

// MARK: CollectionView Medthods

extension HomeViewController: UICollectionViewDelegateFlowLayout {


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: view.bounds.width, height: view.bounds.height / 1.5)
        default:
            return CGSize(width: view.bounds.width, height: view.bounds.height)
        }
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }


    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCarousel", for: indexPath) as! CarouselMainCollectionViewCell

            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath)
            return cell
        default:
            return UICollectionViewCell.init()
        }





    }


}
