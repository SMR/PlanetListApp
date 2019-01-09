//
//  PlanetViewModel.swift
//  PlanetListApp
//
//  Created by iSparshiT on 09/01/19.
//  Copyright © 2019 Samarjeet. All rights reserved.
//

import Foundation
import UIKit

struct PlanetViewModel {
    
    let name: String?
    init(planet: PlanetModel) {
    self.name = planet.results?[0].name ?? "No Planets"
    
}

}

