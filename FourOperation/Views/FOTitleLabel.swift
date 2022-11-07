//
//  FOTitleLabel.swift
//  FourOperation
//
//  Created by Mutlu Aydin on 11/6/22.
//

import UIKit

class FOTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure() {
        
        font = UIFont.systemFont(ofSize: 50)
        textAlignment = .right
        backgroundColor = .systemGray
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
}
