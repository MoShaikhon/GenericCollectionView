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

//refactor with extensions
class GenericBaseCollectionView<CellType: UICollectionViewCell,DataSource, CellConfigDelegate: CellConfig>: UICollectionView, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource  {
    //collection view setup properties
    private var sectionsCount: Int!
    private var cellsCount: Int!
    var cellSize: CGSize!
    var cellConfigDelegate: CellConfigDelegate!
    private let cellID = CellType.description()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        register(CellConfigDelegate.CellType.self, forCellWithReuseIdentifier: CellType.description())
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
        return cellsCount ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let genericCell = dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CellConfigDelegate.CellType
        if let cellConfig = cellConfigDelegate {
            if cellsCount > 0 {
                cellConfig.setCell(cell: genericCell, index: indexPath.item)
            }
        }
        return genericCell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionsCount ?? 1
    }

}
