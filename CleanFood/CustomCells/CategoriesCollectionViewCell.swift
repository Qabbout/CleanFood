//
//  CategoriesCollectionViewCell.swift
//  CleanFood
//
//  Created by Abdulrahman on 4/12/22.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {

    private let currentCategoryIndex: Int = 0


    @IBOutlet weak var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
    }

}

extension CategoriesCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }


func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "category", for: indexPath) as! CategoryCollectionViewCell
    if indexPath.item == currentCategoryIndex {
        cell.categoryButton.tintColor = .black
    }

    return cell

}
}



