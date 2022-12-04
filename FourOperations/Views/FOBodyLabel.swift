//
//  FOBodyLabel.swift
//  FourOperations
//
//  Created by Mutlu Aydin on 11/11/22.
//  Copyright © 2022 Mutlu Aydin. All rights reserved.
//


import UIKit

class FOBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment) {
        super .init(frame: .zero)
        self.textAlignment = textAlignment
        configure()
        
    }
    
    private func configure() {
        textColor = .secondaryLabel
        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.8
        lineBreakMode = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
}
