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



    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "library", for: indexPath) as! LibraryCollectionViewCell
        return cell


    }

}
