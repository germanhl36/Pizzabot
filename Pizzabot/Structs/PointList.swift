//
//  PointGenerator.swift
//  Pizzabot
//
//  Created by German Huerta on 02/09/21.
//

import Foundation

struct PointList:PointListProtocol {

    private var inputString:String
    private var grid:GridProtocol
    private var initialChar:Character
    private var closingChar:Character
    private var divisionChar:Character
    
    init(inputString:String, grid:GridProtocol, initialChar:Character, closingChar:Character, divisionChar:Character) {
        self.inputString = inputString
        self.grid = grid
        self.initialChar = initialChar
        self.closingChar = closingChar
        self.divisionChar = divisionChar
    }
    
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
                let pointValidationResult = point.validate()
                if pointValidationResult != ValidationResult.Success {
                    return pointValidationResult
                }
                
            }
        }
        
        return ValidationResult.Success
    }
    
    func generatePoints() -> [PointProtocol] {
        var result:[PointProtocol] = []
        let values = inputString.split(separator: closingChar)
        for value in values {
            let str = String(value)
            let point = self.generatePointFromString(str: str)
            result.append(point)
        }
        
        return result
        
    }
    
    private func generatePointFromString(str:String) -> PointProtocol {
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
