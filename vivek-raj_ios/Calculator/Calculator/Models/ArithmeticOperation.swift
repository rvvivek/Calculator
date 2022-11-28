//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Raj, Vivek R. (623-Extern) on 28/11/22.
//


import Foundation

enum ArithmeticOperation: CaseIterable, CustomStringConvertible {
    case addition, subtraction, multiplication, division
    
    var description: String {
        switch self {
        case .addition:
            return "+"
        case .subtraction:
            return "−"
        case .multiplication:
            return "×"
        case .division:
            return "÷"
        }
    }
}
