//
//  PhotosController.swift
//  ios-course-l21
//
//  Created by Artur Igberdin on 19.05.2022.
//

import UIKit

final class PhotosVC: UIViewController {

    //MARK: - Private properties
    private lazy var collectionView: UICollectionView = {

        let collectionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    //MARK: - Private methods
    private func setupView() {
        view.addSubview(collectionView)
    }

}

//MARK: - UICollectionViewDelegate
extension PhotosVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Item selected")
    }
}

//MARK: - UICollectionViewDataSource
extension PhotosVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.identifier, for: indexPath) as! PhotoCell
        cell.backgroundColor = .lightGray
        cell.configure(("Likes: 123", "avatar"))
        return cell
    }
}

extension PhotosVC: UICollectionViewDelegateFlowLayout {
    
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
