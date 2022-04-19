//
//  SectionCollectionViewCell.swift
//  CleanFood
//
//  Created by Abdulrahman on 4/19/22.
//

import UIKit

class SectionCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var sectionButton: UIButton!


    override func awakeFromNib() {
        super.awakeFromNib()
        self.sectionButton.titleLabel?.adjustsFontSizeToFitWidth = true

    }

}
