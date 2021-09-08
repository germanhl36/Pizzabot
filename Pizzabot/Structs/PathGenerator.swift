//
//  ProcessArguments.swift
//  Pizzabot
//
//  Created by German Huerta on 02/09/21.
//

import Foundation
struct PathGenerator:ValidatorProtocol {
    
    private var grid:GridProtocol
    private var pointList:PointListProtocol

    init(grid:GridProtocol, pointList:PointListProtocol) {
        self.grid = grid
        self.pointList = pointList
    }

    func validate() -> ValidationResult {
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
    }
    
    func getPath() -> String {
        var currentPositionX:Int = 0
        var currentPositionY:Int = 0
        var result = ""
        for point in pointList.generatePoints() {
            let pointPosition = point.getPoint()
            
            let movementsInX = self.getMovements(currentPosition: currentPositionX,
                                                 pointPosition: pointPosition.x,
                                                 incrementalDirection: Constants.increadisingInXChar,
                                                 decrementalDirection: Constants.decreasingInXChar)
            currentPositionX = pointPosition.x
            result.append(movementsInX)
            
            let movementsInY = self.getMovements(currentPosition: currentPositionY,
                                                 pointPosition: pointPosition.y,
                                                 incrementalDirection: Constants.increadisingInYChar,
                                                 decrementalDirection: Constants.decreasingInYChar)
            currentPositionY = pointPosition.y
            result.append(movementsInY)
            result.append(Constants.dropChar)
            
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
