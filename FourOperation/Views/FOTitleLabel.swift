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
        backgroundColor = .clear
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure() {
        textColor = FOColors.textColor
        font = UIFont(name: FOFont.textFontBold, size: 55)
        textAlignment = .right
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
}
