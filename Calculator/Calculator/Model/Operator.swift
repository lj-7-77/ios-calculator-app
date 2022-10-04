//  Operator.swift
//  Calculator
//  Created by LJ on 2022/09/20.

import Foundation

//enum Operator: Character, CaseIterable {
enum Operator: Character, CaseIterable, CalculateItem {
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
    
    func calculate(lhs: Double, rhs: Double) -> Double {
        var result: Double
        switch self {
        case .add:
            result = add(lhs: lhs, rhs: rhs)
        case .subtract:
            result = subtract(lhs: lhs, rhs: rhs)
        case .multiply:
            result = multiply(lhs: lhs, rhs: rhs)
        case .divide:
            result = divide(lhs: lhs, rhs: rhs)
        }
        return result
    }
    
    private func add(lhs: Double, rhs: Double) -> Double {
        return lhs + rhs
    }
    
    private func subtract(lhs: Double, rhs: Double) -> Double {
        return lhs - rhs
    }
    
    private func multiply(lhs: Double, rhs: Double) -> Double {
        return lhs * rhs
    }
    
    private func divide(lhs: Double, rhs: Double) -> Double {
        return lhs / rhs
    }
}
