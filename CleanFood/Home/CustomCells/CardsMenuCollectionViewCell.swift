//
//  CardsMenuCollectionViewCell.swift
//  CleanFood
//
//  Created by Abdulrahman on 4/13/22.
//

import UIKit
import SDWebImage

class CardsMenuCollectionViewCell: UICollectionViewCell {
    var items: Items? {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    @IBOutlet weak var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self

    }

}

extension CardsMenuCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {


        CGSize(width: UIScreen.main.bounds.width, height:
            UIScreen.main.bounds.height / 1.8)
    }



    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "card", for: indexPath) as! CardCollectionViewCell
        if let items = items {
            cell.titleLabel.text = items[indexPath.item].title
            cell.descriptionLabel.text = items[indexPath.item].itemDescription
            cell.ingredientsLabel.text = items[indexPath.item].ingredients
            cell.image.sd_setImage(with: URL(string:
                items[indexPath.item].image))
            cell.addButton.setTitle(items[indexPath.item].price, for: .normal)

        }


        return cell
    }



}
