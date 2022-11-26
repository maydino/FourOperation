//
//  KeyboardCell.swift
//  FourOperations
//
//  Created by Mutlu Aydin on 11/3/22.
//

import UIKit

class KeyboardCell: UICollectionViewCell {
    
    static let identifier = "KeyboardCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    private func configure() {
        layer.cornerRadius = 20
        clipsToBounds = true        

    }
}
