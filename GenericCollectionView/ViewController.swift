//
//  ViewController.swift
//  GenericCollectionView
//
//  Created by Mohamed Shaikhon on 5/12/19.
//  Copyright © 2019 Mohamed Shaikhon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, GameView {
    var presenter: GamePresenter!

    
    func fetchedGamesSuccessfully() {
        self.gamesCollectionView.configureCollectionView(numberOfCells: presenter.getNumberOfgames(), numberOfSections: 1, cellSize: CGSize(width: self.view.frame.width, height: 100))
        gamesCollectionView.reloadData()
    }
    
    
    weak var gameCellView: GameCellView!
    

    lazy var gamesCollectionView: GenericBaseCollectionView<CustomCell, Game, ViewController> = {
        let cv = GenericBaseCollectionView<CustomCell, Game, ViewController>(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.backgroundColor = .blue
        return cv
    }()
    
    fileprivate func setupCollectionView() {
        gamesCollectionView.cellConfigDelegate = self
        view.addSubview(gamesCollectionView)
        gamesCollectionView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCollectionView()
         presenter = GamePresenter(gameView: self)
        presenter.getAllGames()
    }


}
extension ViewController: CellConfig {
    //protocol conformance
    typealias CellType = CustomCell
    func setCell(cell: CellType, index: Int) {
        presenter.updateGameCell(gameCell: cell, row: index)
    }
}


//TODO: Unit tests, More Alamofire requests, Add Localization
