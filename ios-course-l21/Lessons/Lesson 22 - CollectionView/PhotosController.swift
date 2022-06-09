//
//  PhotosVC.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 19.05.2022.
//

import UIKit

private let reuseIdentifier = "PhotoCollectionCell"

class PhotosController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.identifier)
        //collectionView.register(UINib(nibName: "PhotoCollectionCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
    }
}

// MARK: - UICollectionViewDelegate
extension PhotosController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("Item selected")
    }
}

// MARK: UICollectionViewDataSource
extension PhotosController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.identifier, for: indexPath) as! PhotoCell

        cell.backgroundColor = .lightGray
    
        cell.configure(("Likes: 123", "avatar"))
    
        return cell
    }
}

/*
 //Захардкодили FlowLayout
extension PhotosVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 100, height: 100) //размер ячейки
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20) //отступы от секции
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20 //расстояние между ячейками сверху/вниз (между строками)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20 //расстояние между ячейками слева/направо (между столбцами)
    }
}
 */

//Захардкодили FlowLayout
extension PhotosController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        let inset = 20 //
        
        let itemsInRow = 3 // |[]|[]|
        
        let insetsWidth = inset * (itemsInRow + 1)//ширина отступов всех
        
        let availableWith = collectionView.bounds.width - CGFloat(insetsWidth)
        
        let widthForItem = availableWith / CGFloat(itemsInRow)
        
        return CGSize(width: widthForItem, height: widthForItem) //размер ячейки
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20) //отступы от секции
    }
}




