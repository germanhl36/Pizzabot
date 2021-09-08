//
//  String+Extensions.swift
//  Pizzabot
//
//  Created by German Huerta on 07/09/21.
//

import Foundation
extension String
{
    func trim() -> String
   {
    return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
   }
    
    func trimAllWhiteSpace() -> String {
        let freedSpaceString = self.filter {!($0.isWhitespace || $0.isNewline)}
        return freedSpaceString
    }
}
