//
//  PointProtocol.swift
//  Pizzabot
//
//  Created by German Huerta on 08/09/21.
//

import Foundation

protocol PointProtocol : ValidatorProtocol {
    func getPoint() -> (x: Int, y: Int)
}
