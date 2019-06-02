//
//  CustomCell.swift
//  GenericCollectionView
//
//  Created by Mohamed Shaikhon on 5/13/19.
//  Copyright © 2019 Mohamed Shaikhon. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell,GameCellView {
    
    func setGameTitle(title: String) {
        gameTitleLabel.text = title
    }
    
    let gameTitleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(gameTitleLabel)
        gameTitleLabel.frame = CGRect(x: 0, y: 10, width: frame.width, height: 100)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
