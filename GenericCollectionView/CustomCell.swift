//
//  CustomCell.swift
//  GenericCollectionView
//
//  Created by Mohamed Shaikhon on 5/13/19.
//  Copyright © 2019 Mohamed Shaikhon. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    let someLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(someLabel)
        someLabel.frame = CGRect(x: 0, y: 10, width: 100, height: 100)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateViews() {
        
    }
    
}
