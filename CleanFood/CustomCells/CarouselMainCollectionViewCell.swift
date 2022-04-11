//
//  CarouselMainCollectionViewCell.swift
//  CleanFood
//
//  Created by Abdulrahman on 4/11/22.
//

import UIKit

class CarouselMainCollectionViewCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var pageControl: UIPageControl!


    override func awakeFromNib() {
        super.awakeFromNib()

        self.collectionView.dataSource = self
        self.collectionView.delegate = self






    }


//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        return CGSize(width: super.contentView.frame.width, height: contentView.frame.height)
//
//
//    }



    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "carouselCell", for: indexPath) as! CarouselCollectionViewCell
        cell.imageView.image = UIImage(named: "pizza")


        return cell
    }


}
