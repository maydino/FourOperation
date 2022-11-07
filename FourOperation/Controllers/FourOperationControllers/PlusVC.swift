//
//  PlusVC.swift
//  FourOperation
//
//  Created by Mutlu Aydin on 11/3/22.
//

import UIKit

class PlusVC: UIViewController {

    let keyboardVC = KeyboardVC()
    
    let topNumbersLabel = FOTitleLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemMint
        
        add(keyboardVC, frame: CGRect(x: 0, y: 500, width: view.bounds.width, height: view.bounds.height-500))
        configureTextField()
        keyboardVC.keyboardDelegate = self
    }
    
    func configureTextField() {
        
        
        view.addSubview(topNumbersLabel)
        NSLayoutConstraint.activate([
            topNumbersLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            topNumbersLabel.widthAnchor.constraint(equalToConstant: view.bounds.width/2),
            topNumbersLabel.heightAnchor.constraint(equalToConstant: 50),
            topNumbersLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ])
        
    }
  

}


extension PlusVC: keyboardTextDelegate {
    func keyboardTapped(numbers: Int) {
        topNumbersLabel.text = "\(numbers)"
        print("oldu\(numbers)")
    }

}


