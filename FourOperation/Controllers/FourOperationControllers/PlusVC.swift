//
//  PlusVC.swift
//  FourOperation
//
//  Created by Mutlu Aydin on 11/3/22.
//

import UIKit

class PlusVC: UIViewController {

    let keyboardVC = KeyboardVC()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        add(keyboardVC, frame: CGRect(x: 0, y: 500, width: view.bounds.width, height: view.bounds.height-500))
    }

}
