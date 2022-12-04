//
//  FOLabel.swift
//  FourOperations
//
//  Created by Mutlu Aydin on 11/8/22.
//  Copyright © 2022 Mutlu Aydin. All rights reserved.
//


import UIKit

class FOLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        super.init(frame: .zero)
        
        self.textAlignment = textAlignment
        self.font = UIFont(name: FOFont.textFontLight, size: fontSize)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure() {
        textColor = FOColors.textColor
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
        
    }

}
