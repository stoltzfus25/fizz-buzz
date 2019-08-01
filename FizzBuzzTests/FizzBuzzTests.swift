//
//  FizzBuzzTests.swift
//  FizzBuzzTests
//
//  Created by Samuel Stoltzfus on 7/31/19.
//  Copyright © 2019 Superior Plastic Products, Inc. All rights reserved.
//

import XCTest
@testable import FizzBuzz

class FizzBuzzTests: XCTestCase {
    var sut: FizzBuzz!
    
    override func setUp() {
        sut = FizzBuzz()
    }
    
    override func tearDown() {
        sut = nil
    }

    func testLessThan1WithNoRules_returnsException() {
        XCTAssertThrowsError(try sut.play(number: -3))
        XCTAssertThrowsError(try sut.play(number: 0))
    }
    
    func testLessThan1WithSomeRules_returnsException() {
        sut.rules = [
            Rule(criteria: { "\($0)".contains("3") }, output: "Fizz")
        ]
        XCTAssertThrowsError(try sut.play(number: -3))
    }
    
    func testInitWithNoRules_HasNoRules() {
        XCTAssertEqual(sut.rules.count, 0)
    }
    
    func testRuleContaining7_returnsBlah() {
        sut.rules = [
            Rule(criteria: { "\($0)".contains("7") }, output: "Blah")
        ]
        XCTAssertEqual(try sut.play(number: 7), "Blah")
    }
    
    func testTwoRules_FirstRuleHasPriority() {
        sut.rules = [
            Rule(criteria: { "\($0)".contains("7") }, output: "Blah"),
            Rule(criteria: { "\($0)".contains("7") }, output: "OtherBlah")
        ]
        XCTAssertEqual(try sut.play(number: 7), "Blah")
    }
}
