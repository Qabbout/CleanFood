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

extension MenuCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {




    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section{
            case 0:
                return CGSize(width: contentView.bounds.width, height: 90)
            case 1:
                return CGSize(width: contentView.bounds.width, height: 60)
//            case 2:
//                return CGSize(width: contentView.bounds.width, height: contentView.bounds.height / 1.2)

            default:
                return CGSize(width: contentView.bounds.width, height: contentView.bounds.height)
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(indexPath)

        switch indexPath.section {

        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categories", for: indexPath) as! CategoriesCollectionViewCell
            return cell


        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filters", for: indexPath) as! FiltersCollectionViewCell


            return cell

//        case 2:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCards", for: indexPath) as! MenuCollectionViewCell
//            return cell


        default:
            return UICollectionViewCell.init()
        }
    }

}
