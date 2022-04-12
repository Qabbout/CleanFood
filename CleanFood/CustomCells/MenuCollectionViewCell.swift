//
//  MenuCollectionViewCell.swift
//  CleanFood
//
//  Created by Abdulrahman on 4/11/22.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {


    @IBOutlet weak var collectionView: UICollectionView!



    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
    }

}

extension MenuCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(indexPath)

        switch indexPath.section {

        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCards", for: indexPath) as! CategoriesCollectionViewCell
            return cell

        default:
            return UICollectionViewCell.init()
        }
    }

}
