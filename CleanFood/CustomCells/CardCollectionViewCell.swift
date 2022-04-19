//
//  CardCollectionViewCell.swift
//  CleanFood
//
//  Created by Abdulrahman on 4/13/22.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var background: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!

    @IBAction func addButtonPressed(_ sender: UIButton){

    }
    override func awakeFromNib() {
        super.awakeFromNib()

        background.layer.cornerRadius = 15
        image.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        image.layer.cornerRadius = 15

        

    }
    override func layoutSubviews() {
        background.layer.shadowRadius = 5
        background.layer.shadowOpacity = 0.2
        background.layer.shadowOffset = .zero
        background.layer.shadowColor = UIColor.black.cgColor
        background.layer.shouldRasterize = true
        background.layer.rasterizationScale = UIScreen.main.scale
    }
}
