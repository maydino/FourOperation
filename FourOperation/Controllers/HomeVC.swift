//
//  ViewController.swift
//  FourOperation
//
//  Created by Mutlu Aydin on 10/29/22.
//

import UIKit

final class HomeVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    private var collectionView: UICollectionView!
    
    var selectedNavigationControllerTitle: String?
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
                
        configureCollectionView()
        
    }
    
    func configureCollectionView() {
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: FOCollectionViewFlowLayout())
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.backgroundColor = FOColors.backgroundColor
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
        cell.backgroundColor = FOColors.cellColor
        
        let imageView = UIImageView()
        imageView.frame = CGRect(x: cell.bounds.width/4, y: cell.bounds.width/4, width: cell.bounds.width/2, height: cell.bounds.width/2)
        imageView.tintColor = FOColors.textColor

        
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
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) { collectionView.deselectItem(at: indexPath, animated: true)
        print("Selected a section: \(indexPath.section) X \(indexPath.row)")
        let selection = indexPath.item
        print(selection)
        let pushUpViewController = collectionViewCellPressedAction(item: indexPath.item)
        pushUpViewController.title = selectedNavigationControllerTitle
        pushUpViewController.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "x.circle"), style: .done, target: self, action: #selector(dismissSelf))

        let navigationController = UINavigationController(rootViewController: pushUpViewController)
        navigationController.modalPresentationStyle = .overFullScreen

        present(navigationController, animated: true)
    }
    
    // Collection View Cell Pressed Action Function
    func collectionViewCellPressedAction (item: Int) -> UIViewController {
        if item == 0 {
            selectedNavigationControllerTitle = "Add"
            return PlusVC()
        } else if item == 1 {
            selectedNavigationControllerTitle = "Subtract"
            return SubtractVC()
            
        } else if item == 2 {
            selectedNavigationControllerTitle = "Multiply"
            return MultiplyVC()
            
        } else if item == 3 {
            selectedNavigationControllerTitle = "Divide"
            return PlusVC()
        } else {
            print("Something Wrong!")
            return UIViewController()
        }
        
    }
    
    @objc func dismissSelf() {
        self.dismiss(animated: true)
    }
}


