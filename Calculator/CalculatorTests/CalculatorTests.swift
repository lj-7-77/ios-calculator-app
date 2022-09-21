//  CalculatorTests.swift
//  CalculatorTests
//  Created by LJ on 2022/09/19.

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func testExample() throws {
    }
    
    func testPerformanceExample() throws {
        measure {
        }
    }
    
    func test_3개의값이_큐에_정상적으로_추가되는지() {
        sut.enqueue(element: 10.0)
        sut.enqueue(element: 100.0)
        sut.enqueue(element: 200.0)
        let result: [Double] = sut.rightStack
        XCTAssertEqual(result, [10, 100, 200])
    }
    
    func test_더하기연산_성공하는지() {
        let rightStack: [Double] = [1,2]
        let compute: Operator = .plus
        let result: Double = compute.operate(lhs: rightStack[0], rhs: rightStack[1])
        XCTAssertEqual(result, 3.0)
    }
    
    func test_빼기연산_성공하는지() {
        let rightStack: [Double] = [1,-1]
        let compute: Operator = .minus
        let result: Double = compute.operate(lhs: rightStack[0], rhs: rightStack[1])
        print(result)
        XCTAssertEqual(result, 2.0)
    }
    
    func test_곱하기연산_성공하는지() {
        let rightStack: [Double] = [1500, 3000]
        let compute: Operator = .multiplication
        let value: Double = compute.operate(lhs: rightStack[0], rhs: rightStack[1])
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 20
        numberFormatter.numberStyle = .decimal
        guard let result = numberFormatter.string(for: value) else {
            return
        }
        print(result)
        XCTAssertEqual(result, "4,500,000")
    }
    
    func test_나누기연산_성공하는지() {
        let rightStack: [Double] = [10000, 3]
        let compute: Operator = .division
        let value: Double = compute.operate(lhs: rightStack[0], rhs: rightStack[1])
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 5
        numberFormatter.numberStyle = .decimal
        guard let result = numberFormatter.string(for: value) else {
            return
        }
        print(result)
        XCTAssertEqual(result, "3,333.33333")
    }
}
