//
//  MenuCollectionViewCell.swift
//  CleanFood
//
//  Created by Abdulrahman on 4/11/22.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {

    var currentIndex: Int = 0



    @IBOutlet weak var collectionView: UICollectionView!



    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self

    }


}

extension MenuCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {


        CGSize(width: contentView.bounds.width, height: contentView.bounds.height)


    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        getIndexAndNotify()
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        getIndexAndNotify()

    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        getIndexAndNotify() }




    func getIndexAndNotify() {
        guard let cell = collectionView.visibleCells.first else { return }
        let indexPath = collectionView.indexPath(for: cell)
        NotificationCenter.default
            .post(name: NSNotification.Name("collectionLibrary"),
                  object: indexPath) }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "library", for: indexPath) as! LibraryCollectionViewCell
        return cell


    }

}

