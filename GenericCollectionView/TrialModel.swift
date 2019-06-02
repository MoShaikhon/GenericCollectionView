//
//  TrialModel.swift
//  GenericCollectionView
//
//  Created by Mohamed Shaikhon on 5/13/19.
//  Copyright © 2019 Mohamed Shaikhon. All rights reserved.
//

import Foundation
struct Game: Decodable {
    let _id: String
    let isAAA: Bool
    let protections, versions: [String]
    let updatedAt, title, slug: String
    let releaseDate: String
    let image, imagePoster: String
    let steamPrice: Int?
    let url: String
}
