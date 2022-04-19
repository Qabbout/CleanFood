//
//  ItemsCollectionViewCell.swift
//  CleanFood
//
//  Created by Abdulrahman on 4/19/22.
//

import UIKit
import SystemConfiguration

class ItemsCollectionViewCell: UICollectionViewCell {

    var items: Items?

    @IBOutlet weak var collectionView: UICollectionView!


    override func awakeFromNib() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }

}

extension ItemsCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as! ItemCollectionViewCell
        if let items = items {
            cell.image.sd_setImage(with: URL(string: items[indexPath.item].image))
            cell.price.text = items[indexPath.item].price
            cell.title.text = items[indexPath.item].title


        }


        return cell
    }


}
