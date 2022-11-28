//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Raj, Vivek R. (623-Extern) on 28/11/22.
//


import Foundation

enum Digit: Int, CaseIterable, CustomStringConvertible {
    case zero, one, two, three, four, five, six, seven, eight, nine
    
    var description: String {
        "\(rawValue)"
    }
}
