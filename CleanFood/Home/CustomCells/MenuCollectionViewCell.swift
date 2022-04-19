//
//  MenuCollectionViewCell.swift
//  CleanFood
//
//  Created by Abdulrahman on 4/11/22.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    var currentIndex: Int = 0 {
        didSet {
            NotificationCenter.default.post(name: NSNotification.Name("newCategory"), object: String(currentIndex + 1))
//            print("CURRENTINDEX: \(currentIndex)")
//            self.collectionView.reloadData()
        }
    }


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





    func getIndexAndNotify() {
        guard let cell = collectionView.visibleCells.first else { return }
        let indexPath = collectionView.indexPath(for: cell)
        if indexPath?.section != currentIndex {
            currentIndex = indexPath?.section ?? currentIndex
            NotificationCenter.default
                .post(name: NSNotification.Name("collectionLibrary"),
                      object: indexPath) }
    }




    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        categories?.count ?? 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "library", for: indexPath) as! LibraryCollectionViewCell

        cell.categories = self.categories
        cell.items = self.items

        return cell


    }

}

