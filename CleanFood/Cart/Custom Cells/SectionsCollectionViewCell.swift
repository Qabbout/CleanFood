//
//  SectionsCollectionViewCell.swift
//  CleanFood
//
//  Created by Abdulrahman on 4/19/22.
//

import UIKit

class SectionsCollectionViewCell: UICollectionViewCell {

    private var currentItemIndex: Int = 0 {


        didSet {
            print("index: \(currentItemIndex)")

            DispatchQueue.main.async { [weak self] in

                self?.collectionView.scrollToItem(at: IndexPath(item: self?.currentItemIndex ?? 0, section: 0), at: .centeredHorizontally, animated: true)
                self?.collectionView.reloadData()

            }

        }
    }



    @IBOutlet weak var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self

        NotificationCenter.default.addObserver(self, selector: #selector(gotNewIndex(_:)), name: NSNotification.Name("sections"), object: nil)

    }
    deinit {
        NotificationCenter.default
            .removeObserver(self,
                            name: NSNotification.Name("sections"),
                            object: nil)



    }


    @objc private func gotNewIndex(_ notification: Notification) {
        currentItemIndex = notification.object as! Int
    }




}

extension SectionsCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "section", for: indexPath) as! SectionCollectionViewCell

        switch indexPath.item {
        case 0:
            cell.sectionButton.setTitle("Cart", for: .normal)
        case 1:
            cell.sectionButton.setTitle("Order", for: .normal)
        case 2:
            cell.sectionButton.setTitle("Information", for: .normal)
        default:
            cell.sectionButton.setTitle(String(currentItemIndex), for: .normal)
        }


        if indexPath.item == currentItemIndex {
            cell.sectionButton.tintColor = .black

        }
        else {
            cell.sectionButton.tintColor = .secondaryLabel
        }

        return cell

    }

}





