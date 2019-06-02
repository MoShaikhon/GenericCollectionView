//
//  GameService.swift
//  MVPTrial
//
//  Created by Mohamed Shaikhon on 5/20/19.
//  Copyright © 2019 Mohamed Shaikhon. All rights reserved.
//

import Foundation
import Alamofire
let endPoint = "https://api.crackwatch.com/api/games"

class GameService {
    func fetchAllGames( completion: @escaping ([Game]?)-> ()) {
        request(endPoint).responseJSON { (response) in
            switch response.result {
            case .success:
               let games = parseResponse(response: response.data!)
                completion(games)
            case .failure:
                break
            }
        
    }
    func parseResponse(response: Data)->[Game]? {
        do {
            let games = try JSONDecoder().decode([Game].self, from: response)
            return games
        }catch {
            print(error)
            return nil
        }
    }
    }
}
