//
//  PointGenerator.swift
//  Pizzabot
//
//  Created by German Huerta on 02/09/21.
//

import Foundation

struct PointList:ValidatorProtocol {
    var inputString:String
    var grid:Grid?
    var initialChar:Character
    var closingChar:Character
    var divisionChar:Character
    
    func validate() -> ValidationResult {
        let countOpeningChar = inputString.filter { char in
            return char == initialChar
        }
        let countClosingChar = inputString.filter { char in
            return char == closingChar
        }
        let countDividerChar = inputString.filter { char in
            return char == divisionChar
        }

        if countOpeningChar.count != countClosingChar.count && countOpeningChar.count != countDividerChar.count {
            return ValidationResult.InvalidPointListFormat
        } else {
            let values = inputString.split(separator: closingChar)
            for value in values {
                let str = String(value)
                let point = self.generatePointFromString(str: str)
                if point.validate() == ValidationResult.InvalidPointFormat {
                    return ValidationResult.InvalidPointFormat
                }
                
            }
        }
        
        return ValidationResult.Success
    }
    
    func generatePoints() -> [Point] {
        var result:[Point] = []
        let values = inputString.split(separator: closingChar)
        for value in values {
            let str = String(value)
            let point = self.generatePointFromString(str: str)
            result.append(point)
        }
        
        return result
        
    }
    
    private func generatePointFromString(str:String) -> Point {
        var valueStr = str
        if valueStr.contains(initialChar) {
           valueStr = valueStr.replacingOccurrences(of: String(initialChar), with: "")
        }
        if valueStr.contains(closingChar) {
            valueStr = valueStr.replacingOccurrences(of: String(closingChar), with: "")
        }
        return Point(input: valueStr, divisionChar: divisionChar, grid: self.grid)
    }
}
