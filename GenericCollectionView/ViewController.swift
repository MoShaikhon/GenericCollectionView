//
//  ViewController.swift
//  GenericCollectionView
//
//  Created by Mohamed Shaikhon on 5/12/19.
//  Copyright © 2019 Mohamed Shaikhon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CellConfig {
    
    //protocol conformance
    typealias CellType = CustomCell
    func setCell(cell: CustomCell, index: Int) {
        cell.backgroundColor = .red
        cell.someLabel.text = items[index].someText
    }
    
    //dummy data
     var items: [TrialModel] = [TrialModel(someText: "hi"), TrialModel(someText: "hello")]
    
    //instantiate a collectionview
    lazy var collectionView: GenericBaseCollectionView<CustomCell, TrialModel, ViewController> = {
        let cv = GenericBaseCollectionView<CustomCell, TrialModel, ViewController>(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.configureCollectionView(numberOfCells: items.count, numberOfSections: 1, cellSize: CGSize(width: 100, height: 100))
        cv.backgroundColor = .blue
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.cellConfig = self
        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
    }
    


}
