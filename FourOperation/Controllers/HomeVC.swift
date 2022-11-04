//
//  ViewController.swift
//  FourOperation
//
//  Created by Mutlu Aydin on 10/29/22.
//

import UIKit

final class HomeVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    private var collectionView: UICollectionView!
    
    let keyboardVC = KeyboardVC()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemRed
        
        configureCollectionView()
        
        add(keyboardVC, frame: CGRect(x: 0, y: 500, width: view.bounds.width, height: view.bounds.height-500))
        
        
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
        
        let imageView = UIImageView()
        imageView.frame = CGRect(x: cell.bounds.width/4, y: cell.bounds.width/4, width: cell.bounds.width/2, height: cell.bounds.width/2)
        imageView.tintColor = .systemTeal

        
        if indexPath.item == 0 {
            imageView.image = UIImage(systemName: "plus")
            
        } else if indexPath.item == 1 {
            imageView.image = UIImage(systemName: "minus")
            imageView.frame = CGRect(x: cell.bounds.width/4, y: cell.bounds.width/2-15, width: cell.bounds.width/2, height: cell.bounds.width/8)
            
            
        } else if indexPath.item == 2 {
            imageView.image = UIImage(systemName: "multiply")
            
        } else if indexPath.item == 3 {
            imageView.image = UIImage(systemName: "divide")
            
        }
        
        
        
        cell.contentView.addSubview(imageView)
        return cell
    }


}

extension UIViewController {
    func add(_ child: UIViewController, frame: CGRect? = nil) {
        addChild(child)

        if let frame = frame {
            child.view.frame = frame
        }

        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func remove() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
