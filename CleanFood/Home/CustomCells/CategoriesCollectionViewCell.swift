//
//  CategoriesCollectionViewCell.swift
//  CleanFood
//
//  Created by Abdulrahman on 4/12/22.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    private var indexPath: IndexPath!


    private var currentCategoryIndex: Int = 0 {
        didSet {


            DispatchQueue.main.async { [weak self] in


                self?.collectionView.scrollToItem(at: IndexPath(item: self?.currentCategoryIndex ?? 0, section: 0), at: .centeredHorizontally, animated: true)
//                self?.collectionView.reloadData()

            }


        }
    }
    var categories: Categories?
    {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.collectionView.reloadData()
            }
        }
    }



    @IBOutlet weak var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(gotNewIndex(_:)), name: NSNotification.Name("collectionLibrary"), object: nil)

    }
    deinit {
        NotificationCenter.default
            .removeObserver(self,
                            name: NSNotification.Name("collectionLibrary"),
                            object: nil)



    }


    @objc private func gotNewIndex(_ notification: Notification) {
        let indexPath = notification.object as! IndexPath
        self.indexPath = indexPath
        currentCategoryIndex = indexPath.section
    }



}

extension CategoriesCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories?.count ?? 20
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "category", for: indexPath) as! CategoryCollectionViewCell

        cell.categoryButton.setTitle(categories?[indexPath.item].name, for: .normal)

        if indexPath.item == currentCategoryIndex {
            cell.categoryButton.tintColor = .black

        }
        else {
            cell.categoryButton.tintColor = .secondaryLabel
        }



        return cell

    }
}



