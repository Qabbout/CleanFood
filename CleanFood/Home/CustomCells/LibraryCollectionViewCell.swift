//
//  LibraryCollectionViewCell.swift
//  CleanFood
//
//  Created by Abdulrahman on 4/13/22.
//

import UIKit

class LibraryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var collectionView: UICollectionView!

    var categories: Categories? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.collectionView.reloadData()
            }

        }
    }
    var items: Items? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.collectionView.reloadData()
            }

        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self


    }
}


extension LibraryCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: contentView.bounds.width, height: 80)
        case 1:
            return CGSize(width: contentView.bounds.width, height: 50)
        case 2:
            return CGSize(width: contentView.bounds.width, height: contentView.bounds.height / 1.2)

        default:
            return CGSize(width: contentView.bounds.width, height: contentView.bounds.height)
        }
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {

        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categories", for: indexPath) as! CategoriesCollectionViewCell

            cell.categories = self.categories

            return cell


        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filters", for: indexPath) as! FiltersCollectionViewCell


            return cell

        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menu", for: indexPath) as! CardsMenuCollectionViewCell

            cell.items = self.items
            return cell


        default:
            return UICollectionViewCell.init()
        }
    }


}
