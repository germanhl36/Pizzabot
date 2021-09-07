//
//  GridGenerator.swift
//  Pizzabot
//
//  Created by German Huerta on 02/09/21.
//

import Foundation
struct Grid:ValidatorProtocol {
    var input:String
    var divisionChar:Character
    
    func validate() -> ValidationResult {
        if input.contains(divisionChar) {
            let splitResult = input.split(separator: divisionChar)
            if splitResult.count != 2 {
                return ValidationResult.InvalidMatrixSizeFormat
            } else {
                for subString in splitResult {
                    let str = String(subString)
                    guard let _ = Int(str) else {
                        return ValidationResult.InvalidNumber
                    }
                }
                
            }
        } else {
            return ValidationResult.InvalidMatrixSizeFormat
        }
        return ValidationResult.Success
    }
    
    func calculateSize() -> (m:Int, n:Int) {
        var m = 0, n = 0
        let splitResult = input.split(separator: divisionChar)
        let strM = String(splitResult[0])
        let strN = String(splitResult[1])
        if let integerValue = Int(strM), let integerValueN = Int(strN) {
            m = integerValue
            n = integerValueN
        }
        return (m:m, n:n)
    }
}
