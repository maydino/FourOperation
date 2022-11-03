//
//  ViewController.swift
//  FourOperation
//
//  Created by Mutlu Aydin on 10/29/22.
//

import UIKit

class HomeVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemRed
        
       configureCollectionView()
        
    }
    
    func configureCollectionView() {
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: FOCollectionViewFlowLayout())
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.backgroundColor = .cyan
        collectionView.register(FOCollectionViewCell.self, forCellWithReuseIdentifier: FOCollectionViewCell.identifier)

    }
    
    func FOCollectionViewFlowLayout() -> UICollectionViewFlowLayout {
        
        // Cell width calculation
        let width = view.bounds.width
        let padding: CGFloat  = 14
        let minimumItemSpacing: CGFloat = 7
        let availableWidth = width - (padding*2) - (minimumItemSpacing*2)
        let itemWidth = availableWidth/2
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 2*padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        
        return flowLayout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FOCollectionViewCell.identifier, for: indexPath)
        cell.backgroundColor = .darkGray
        
        let image = UIImageView()
        image.frame = CGRect(x: cell.bounds.width/4, y: cell.bounds.width/4, width: cell.bounds.width/2, height: cell.bounds.width/2)
        
        if indexPath.item == 0 {
            image.image = UIImage(systemName: "plus")
            
        } else if indexPath.item == 1 {
            image.image = UIImage(systemName: "minus")
            image.frame = CGRect(x: cell.bounds.width/4, y: cell.bounds.width/2-18, width: cell.bounds.width/2, height: cell.bounds.width/5)
            
            
        } else if indexPath.item == 2 {
            image.image = UIImage(systemName: "multiply")
            
        } else if indexPath.item == 3 {
            image.image = UIImage(systemName: "divide")
            
        }
        
        
        
        cell.contentView.addSubview(image)
        return cell
    }


}

