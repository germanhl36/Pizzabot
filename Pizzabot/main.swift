//
//  main.swift
//  Pizzabot
//
//  Created by German Huerta on 02/09/21.
//

import Foundation

func pizzabot(_ args:String) -> String {
    let arguments = args.trimAllWhiteSpace()
    if let firstOpeningCharIndex = arguments.firstIndex(of: Constants.openingChar) {
        let matrixSizeSubstring = arguments[..<firstOpeningCharIndex]
        let matrixSize = String(matrixSizeSubstring)
        let grid = Grid(input: matrixSize, divisionChar: Constants.dividigCharGridSize)
        
        
        let pointsSubstring = arguments[firstOpeningCharIndex ..< arguments.endIndex ]
        let pointsStr = String(pointsSubstring)
        let pointList = PointList(inputString: pointsStr, grid: grid, initialChar: Constants.openingChar, closingChar: Constants.closingChar, divisionChar: Constants.dividingChar)
        
        
        let process = PathGenerator(grid:grid, pointList:pointList)
        let validationResult = process.validate()
        switch validationResult {
        case .Success:
            return process.getPath()
        default :
            return validationResult.rawValue
        }
    } else {
        return ValidationResult.InvalidInputArgumentsFormat.rawValue
    }
}

var inputArray = CommandLine.arguments
if inputArray.count > 0 {
    if let first  = inputArray.first, first.contains("/") {
        inputArray.removeFirst()
    }
    
    if let args = inputArray.first {
        let result = pizzabot(args)
        print(result)
    } else {
        print(ValidationResult.InvalidInputArgumentsFormat.rawValue)
    }
} else {
    print(ValidationResult.InvalidInputArgumentsFormat.rawValue)
}

//"5x5 (1, 3) (4, 4)"




