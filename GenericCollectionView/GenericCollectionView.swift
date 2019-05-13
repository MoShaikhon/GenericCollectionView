//
//  File.swift
//  GenericCollectionView
//
//  Created by Mohamed Shaikhon on 5/12/19.
//  Copyright © 2019 Mohamed Shaikhon. All rights reserved.
//

import UIKit

protocol CellConfig: class{
    associatedtype CellType: UICollectionViewCell
    func setCell(cell: CellType, index: Int)
}


class GenericBaseCollectionView<CellType: UICollectionViewCell,DataSource, cellConfigDelegate: CellConfig>: UICollectionView, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource  {
    //collection view setup properties
    var sectionsCount: Int!
    var cellsCount: Int!
    let cellID = CellType.description()
    var cellSize: CGSize!
    var cellConfig: cellConfigDelegate!
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        register(CellType.self, forCellWithReuseIdentifier: CellType.description())
        dataSource = self
        delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCollectionView(numberOfCells: Int, numberOfSections: Int, cellSize: CGSize){
        sectionsCount = numberOfSections
        cellsCount = numberOfCells
        self.cellSize = cellSize
        reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let genericCell = dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! cellConfigDelegate.CellType
        if let cellConfig = cellConfig {
        cellConfig.setCell(cell: genericCell, index: indexPath.item)
        }
        return genericCell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionsCount
    }

}
