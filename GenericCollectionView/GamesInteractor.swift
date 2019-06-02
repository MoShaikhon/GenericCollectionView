//
//  GamesInteractor.swift
//  MVPTrial
//
//  Created by Mohamed Shaikhon on 5/20/19.
//  Copyright © 2019 Mohamed Shaikhon. All rights reserved.
//

import Foundation

class GamesInteractor {
    func getAllGames(completion: @escaping ([Game]?)->Void) {
        let gameService = GameService()
        gameService.fetchAllGames { (games) in
        print(games![0].title)
            completion(games ?? nil)
        }
    }
   
}
