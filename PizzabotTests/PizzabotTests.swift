//
//  PizzabotTests.swift
//  PizzabotTests
//
//  Created by German Huerta on 07/09/21.
//

import XCTest

class PizzabotTests: XCTestCase {
    
    func test_pizzabot_correct_input() {
        XCTAssertEqual(pizzabot("5x5 (1, 3) (4, 4)"), "ENNNDEEEND")
    }
    
    func test_pizzabot_no_input() {
        XCTAssertEqual(pizzabot(""), "Please use the format MxN (#,#) (#,#)")
    }
    
    func testpizzbot_invalid_matrix(){
        XCTAssertEqual(pizzabot("4x10.5 (1, 3) (4, 4)"), "Please use integer numbers for the grid size and point positions coordenates")
    }
    
    func test_pizzabot_invalid_grid_dimensions() {
        XCTAssertEqual(pizzabot("5x5x3 (1, 3) (4, 4)"), "Please use the format MxN for the size of the grid")
    }
    
    func test_pizzabot_invalid_pointlist() {
        XCTAssertEqual(pizzabot("5x5 [1, 3] [4, 4]"), "Please use the format MxN (#,#) (#,#)")
    }
    
    func test_pizzabot_point_without_comma() {
        XCTAssertEqual(pizzabot("5x5 (1 3) (4, 4)"), "Please use the format (#,#) (#,#)")
    }
}
