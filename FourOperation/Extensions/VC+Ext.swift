//
//  VC+Ext.swift
//  FourOperation
//
//  Created by Mutlu Aydin on 11/4/22.
//

import UIKit

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

extension UIViewController {

    /// Utility method to add a `UIViewController` instance to a `UIView`.
    ///
    /// Calls all necessary methods for adding a child view controller and set the constraints
    /// between the views.
    ///
    /// - Parameters:
    ///   - viewController: `UIViewController` instance that will be added to `contentView`.
    ///   - contentView: `UIView` that will add the `childViewController` as its subview.
    func add(childViewController viewController: UIViewController, to contentView: UIView) {
        let matchParentConstraints = [
            viewController.view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            viewController.view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            viewController.view.heightAnchor.constraint(equalToConstant: 2*contentView.bounds.height/5),
            viewController.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]

        addChild(viewController)
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(viewController.view)
        NSLayoutConstraint.activate(matchParentConstraints)
        viewController.didMove(toParent: self)
    }
}

extension UIViewController {
    
    func gameEnded(correct: Int) {
        let congratsVC = CongratsVC()
        congratsVC.correctAnswersCountLabel.text = "\(correct) / 10"
        congratsVC.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "x.circle"), style: .done, target: self, action: #selector(dismissSelf))
        show(congratsVC, sender: self)
    }
    
    @objc func dismissSelf() {
        self.dismiss(animated: true)
    }
}

