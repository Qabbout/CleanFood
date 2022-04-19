//
//  ItemCollectionViewCell.swift
//  CleanFood
//
//  Created by Abdulrahman on 4/19/22.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var delete: UIButton!
    @IBAction func deleteTapped(_ sender: Any?) { }

  
}


