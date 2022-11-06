//
//  PlusVC.swift
//  FourOperation
//
//  Created by Mutlu Aydin on 11/3/22.
//

import UIKit

class PlusVC: UIViewController {

    let keyboardVC = KeyboardVC()
    
    let topNumbersLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray
        
        add(keyboardVC, frame: CGRect(x: 0, y: 500, width: view.bounds.width, height: view.bounds.height-500))
        configureTextField()
    }
    
    func configureTextField() {
        topNumbersLabel.backgroundColor = .systemPink
        topNumbersLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topNumbersLabel)
        NSLayoutConstraint.activate([
            topNumbersLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            topNumbersLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            topNumbersLabel.heightAnchor.constraint(equalToConstant: 150),
            topNumbersLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
    }
    
    
    

}


