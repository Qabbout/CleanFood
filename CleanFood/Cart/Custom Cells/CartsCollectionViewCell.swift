//
//  CartsCollectionViewCell.swift
//  CleanFood
//
//  Created by Abdulrahman on 4/19/22.
//

import UIKit

class CartsCollectionViewCell: UICollectionViewCell {

    var items: Items?



    @IBOutlet weak var collectionView: UICollectionView!

    override func awakeFromNib() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension CartsCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       CGSize(width: contentView.bounds.width, height: contentView.bounds.height)

    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cart", for: indexPath) as! CartCollectionViewCell
        cell.items = self.items
        
        return cell
    }
    
}
