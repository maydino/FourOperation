//
//  KeyboardVC.swift
//  FourOperation
//
//  Created by Mutlu Aydin on 11/3/22.
//

import UIKit

protocol keyboardTextDelegate {
    func keyboardTapped(numbers: [Int])
}

final class KeyboardVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: UICollectionViewFlowLayout())
    var keyboardDelegate: keyboardTextDelegate!
    
    var numPadNumbers = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        configureCollectionView()
        
    }
    
    func configureCollectionView() {
        
        collectionView.frame = view.bounds
        collectionView.collectionViewLayout = KeyboardViewFlowLayout()
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.backgroundColor = AppColors.backgroundColor
        collectionView.register(KeyboardCell.self, forCellWithReuseIdentifier: KeyboardCell.identifier)

    }
    
    // Collection View Flow Layout
    func KeyboardViewFlowLayout() -> UICollectionViewFlowLayout {
        
        // Cell width calculation
        let width = view.bounds.width
        let height = view.bounds.height
        let padding: CGFloat  = 10
        let minimumItemSpacing: CGFloat = 5
        let availableWidth = width - (padding*3) - (minimumItemSpacing*3)
        let availableHeight = height - (padding*4) - (minimumItemSpacing*4)

        let itemWidth = availableWidth/3
        let itemHeight = availableHeight/11
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        
        return flowLayout
    }
    
    // Collection View Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KeyboardCell.identifier, for: indexPath)
        cell.backgroundColor = AppColors.buttonColor
        
        let imageView = UIImageView()
        imageView.frame = CGRect(x: cell.bounds.width/4, y: cell.bounds.height/4, width: cell.bounds.width/2, height: cell.bounds.height/2)
        imageView.tintColor = AppColors.textColorH
        
        let textLabel = UILabel()
        textLabel.frame = CGRect(x: cell.bounds.width/4, y: cell.bounds.height/4, width: cell.bounds.width/2, height: cell.bounds.height/2)
        textLabel.textColor = AppColors.textColor
        textLabel.textAlignment = .center
        textLabel.font = textLabel.font.withSize(30)
        
        if indexPath.item == 0 {
            textLabel.text = "1"
        } else if indexPath.item == 1 {
            textLabel.text = "2"
        } else if indexPath.item == 2 {
            textLabel.text = "3"
        } else if indexPath.item == 3 {
            textLabel.text = "4"
        } else if indexPath.item == 4 {
            textLabel.text = "5"
        } else if indexPath.item == 5 {
            textLabel.text = "6"
        } else if indexPath.item == 6 {
            textLabel.text = "7"
        } else if indexPath.item == 7 {
            textLabel.text = "8"
        } else if indexPath.item == 8 {
            textLabel.text = "9"
        } else if indexPath.item == 9 {
            imageView.image = UIImage(systemName: "delete.left")
        } else if indexPath.item == 10 {
            textLabel.text = "0"
        } else if indexPath.item == 11 {
            textLabel.text = "OK"
        }

        cell.contentView.addSubview(textLabel)
        cell.contentView.addSubview(imageView)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) { collectionView.deselectItem(at: indexPath, animated: true)
        print("Selected a section: \(indexPath.section) X \(indexPath.row)")
        numPadNumbers.append(indexPath.row+1)
        keyboardDelegate.keyboardTapped(numbers: numPadNumbers)

        
    }


}

