//
//  FiltersCollectionViewCell.swift
//  CleanFood
//
//  Created by Abdulrahman on 4/12/22.
//

import UIKit

class FiltersCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var filtersLabel: UILabel!
    @IBOutlet weak var spicyFilterButton: UIButton!
    @IBOutlet weak var veganFilterButton: UIButton!


    override func awakeFromNib() {
        super.awakeFromNib()

        setupButtonsUI()
    }
    private func setupButtonsUI() {
        spicyFilterButton.layer.borderWidth = 1.0
        spicyFilterButton.layer.borderColor = UIColor.secondaryLabel.cgColor
        spicyFilterButton.layer.cornerRadius = 5.0
        spicyFilterButton.clipsToBounds = true

        veganFilterButton.layer.borderWidth = 1.0
        veganFilterButton.layer.borderColor = UIColor.secondaryLabel.cgColor
        veganFilterButton.layer.cornerRadius = 5.0
        veganFilterButton.clipsToBounds = true

    }

}
