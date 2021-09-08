//
//  PointListProtocol.swift
//  Pizzabot
//
//  Created by German Huerta on 08/09/21.
//

import Foundation

protocol PointListProtocol:ValidatorProtocol {
    func generatePoints() -> [PointProtocol]

}
