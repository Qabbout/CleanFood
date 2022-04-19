//
//  CartCollectionViewCell.swift
//  CleanFood
//
//  Created by Abdulrahman on 4/19/22.
//

import UIKit

class CartCollectionViewCell: UICollectionViewCell {

    var items: Items?



    @IBOutlet weak var collectionView: UICollectionView!

    override func awakeFromNib() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }

}
extension CartCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sections", for: indexPath) as! SectionsCollectionViewCell

            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "items", for: indexPath) as! ItemsCollectionViewCell
                cell.items = items
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "total", for: indexPath) as! TotalCollectionViewCell
            return cell

        default:
            return UICollectionViewCell.init()
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: contentView.bounds.width, height: 80)
        case 1:
                return CGSize(width: contentView.bounds.width, height: UIScreen.main.bounds.height / 1.7)
        case 2:
            return CGSize(width: contentView.bounds.width, height: 80)
        default:
            return .zero
        }


    }

  



}
