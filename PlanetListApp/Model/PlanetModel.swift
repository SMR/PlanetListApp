//
//  PlanetModel.swift
//  PlanetListApp
//
//  Created by iSparshiT on 09/01/19.
//  Copyright © 2019 Samarjeet. All rights reserved.
//

import Foundation
struct PlanetModel:Decodable {
    let count:Int?
    let next:String?
    let previous:String?
    let results:[Result]?
}

