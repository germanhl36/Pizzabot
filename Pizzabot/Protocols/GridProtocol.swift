//
//  GridProtocol.swift
//  Pizzabot
//
//  Created by German Huerta on 08/09/21.
//

import Foundation
protocol GridProtocol : ValidatorProtocol {
    func calculateSize() -> (m:Int, n:Int)
}
