//
//  FOStackView.swift
//  FourOperation
//
//  Created by Mutlu Aydin on 11/7/22.
//

import UIKit

class FOView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        //MARK: - Stack View Configure
        backgroundColor = .systemPink
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 40
        layer.masksToBounds = true
    }
    
    
}
