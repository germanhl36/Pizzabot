//
//  Point.swift
//  Pizzabot
//
//  Created by German Huerta on 02/09/21.
//

import Foundation

struct Point:ValidatorProtocol {
    var input:String
    var divisionChar:Character
    var grid:Grid?
    
    
    func validate() -> ValidationResult {
        guard let grid = self.grid else {
            return ValidationResult.InvalidMatrixSizeFormat
        }
        let gridSize = grid.calculateSize()
        
        if input.contains(divisionChar) {
            let splitResult = input.split(separator: divisionChar)
            if splitResult.count != 2 {
                return ValidationResult.InvalidPointFormat
            } else {
                let strX = String(splitResult[0])
                let strY = String(splitResult[1])
                guard let x = Int(strX), let y = Int(strY)  else  {
                    return ValidationResult.InvalidNumber
                }
                if  x < 0 || y < 0 ||  x > gridSize.m || y > gridSize.m {
                    return ValidationResult.InvalidPointPosition
                }
            }
        } else {
            return ValidationResult.InvalidPointFormat
        }
        return ValidationResult.Success
    }

    func getPoint() -> (x: Int, y: Int) {
        var x = 0, y = 0
        let splitResult = input.split(separator: divisionChar)
        let strM = String(splitResult[0])
        let strN = String(splitResult[1])
        if let integerValue = Int(strM), let integerValueN = Int(strN) {
            x = integerValue
            y = integerValueN
        }
        
        return (x:x, y:y)
    }
}
