//
//  FOStackView.swift
//  FourOperation
//
//  Created by Mutlu Aydin on 11/8/22.
//

import UIKit

class FOStackView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        axis = .vertical
        distribution = .fillEqually
        backgroundColor = .systemPink
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 20
    }
}
