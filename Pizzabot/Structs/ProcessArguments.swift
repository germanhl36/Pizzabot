//
//  ProcessArguments.swift
//  Pizzabot
//
//  Created by German Huerta on 02/09/21.
//

import Foundation
struct ProcessArguments:ValidatorProtocol {
    
    private var args:[String]
    private var arguments:String!
    private var grid:Grid?
    private var pointList:PointList?
    
    init(args:[String] ) {
        self.args = args
        
        if self.args[0].contains("/") {
            self.args.removeFirst()
        }
        
        self.arguments = ""
        for index in 0 ..< self.args.count {
            self.arguments.append(self.args[index])
        }
        if let firstOpeningCharIndex = self.arguments.firstIndex(of: Constants.openingChar) {
            self.grid = self.getGrid(self.arguments, index: firstOpeningCharIndex)
            self.pointList = self.getPointList(fromStr: self.arguments, index: firstOpeningCharIndex)
        }
    }
    
    func validate() -> ValidationResult {
        if let grid = self.grid, let pointList = self.pointList {
            let gridValidationResult = grid.validate()
            if gridValidationResult == .Success {
                let pointListValidationResult = pointList.validate()
                if  pointListValidationResult == .Success {
                    return .Success
                } else {
                    return pointListValidationResult
                }
            }else {
                return gridValidationResult
            }
        } else {
            return ValidationResult.InvalidInputArgumentsFormat
        }
    }
    
    
    private func getPointList(fromStr:String, index:String.Index) -> PointList {
        let pointsSubstring = fromStr[index ..< fromStr.endIndex ]
        let pointsStr = String(pointsSubstring)
        let pointList = PointList(inputString: pointsStr, grid: grid, initialChar: Constants.openingChar, closingChar: Constants.closingChar, divisionChar: Constants.dividingChar)
        return pointList
    }
    
    private func getGrid(_ fromStr:String, index:String.Index) -> Grid {
        let matrixSizeSubstring = fromStr[..<index]
        let matrixSize = String(matrixSizeSubstring)
        let grid = Grid(input: matrixSize, divisionChar: Constants.dividigCharGridSize)
        return grid
    }
    
    func getPath() -> String {
        var currentPositionX:Int = 0
        var currentPositionY:Int = 0
        var result = ""
        if let pointList = self.pointList {
            for point in pointList.generatePoints() {
                let pointPosition = point.getPoint()
                
                let movementsInX = self.getMovements(currentPosition: currentPositionX, pointPosition: pointPosition.x, incrementalDirection: "E", decrementalDirection: "W")
                currentPositionX = pointPosition.x
                result.append(movementsInX)
                
                let movementsInY = self.getMovements(currentPosition: currentPositionY, pointPosition: pointPosition.y, incrementalDirection: "N", decrementalDirection: "S")
                currentPositionY = pointPosition.y
                result.append(movementsInY)
                result.append("D")
                
            }
        }
        return result
    }
    
    private func getMovements(currentPosition:Int, pointPosition:Int, incrementalDirection:String, decrementalDirection:String) -> String {
        var movements = ""
        var numberOfSteps = 0
        var currentDirection = ""
        if pointPosition > currentPosition {
            numberOfSteps = pointPosition - currentPosition
            currentDirection = incrementalDirection
        } else {
            numberOfSteps = currentPosition - pointPosition
            currentDirection = decrementalDirection
        }
        for _ in 0 ..< numberOfSteps {
            movements += currentDirection
        }
        return movements
    }

}
