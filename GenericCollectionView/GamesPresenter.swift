//
//  GamesPresenter.swift
//  GenericCollectionView
//
//  Created by Mohamed Shaikhon on 5/28/19.
//  Copyright © 2019 Mohamed Shaikhon. All rights reserved.
//

import Foundation

protocol GameView: class {
    func fetchedGamesSuccessfully()
}
protocol GameCellView: class {
    func setGameTitle(title: String)
}

class GamePresenter {
    weak var gameView: GameView?
    let gamesInteractor = GamesInteractor()
    var games = [Game]()
    
    init(gameView: GameView) {
        self.gameView = gameView
    }
    func getAllGames() {
        gamesInteractor.getAllGames { [weak self] (games) in
            if let self = self, let games = games {
                self.games = games
                self.gameView?.fetchedGamesSuccessfully()
            }
        }
    }
    
    func updateGameCell(gameCell: GameCellView, row: Int) {
        let gameTitle = games[row].title
        gameCell.setGameTitle(title: gameTitle)
    }
    func getNumberOfgames()->Int {
        return games.count
    }

}
