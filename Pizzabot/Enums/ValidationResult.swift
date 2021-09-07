//
//  ValidationErrors.swift
//  Pizzabot
//
//  Created by German Huerta on 02/09/21.
//

import Foundation
enum ValidationResult:String {
    case InvalidInputArgumentsFormat = "Please use the format MxN (#,#) (#,#)"
    case InvalidMatrixSizeFormat = "Please use the format MxN for the size of the grid"
    case InvalidPointListFormat = "Please use the format (#,#) por the points of the grid"
    case InvalidPointFormat = "Please use the format (#,#) (#,#)"
    case InvalidPointPosition = "One of the points is out of the grid maximum values"
    case InvalidNumber = "Please use integer numbers for the grid size and point positions coordenates"
    case Success = "Success"
}


