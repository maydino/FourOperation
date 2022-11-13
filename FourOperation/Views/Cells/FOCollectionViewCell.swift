//
//  FOCollectionViewCell.swift
//  FourOperation
//
//  Created by Mutlu Aydin on 11/1/22.
//

import UIKit

class FOCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "FOCollectionViewCell"
    
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
        layer.cornerRadius = 10
        clipsToBounds = true
        layer.backgroundColor = FOColors.cellColor?.cgColor
        

    }
}
