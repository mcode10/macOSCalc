//
//  CalcEngineProtocol.swift
//  iOS Calculator
//
//  Created by Manas Paranjape on 3/30/19.
//  Copyright © 2019 DesignX6. All rights reserved.
//

import Foundation

enum operatorCases {
    case add
    case subtract
    case multiply
    case divide
}

func getCalcEngine() -> CalcEngineProtocol {
    return CalculatorEngine()
}

protocol CalcEngineProtocol {
    func percenter(original: Double) -> Double
    func positiveNegative(original: Double) -> Double
    func clear()
    func equalPressed(operand: Double) -> Double
    func calcEngineInput(operand: Double, operationPassed: operatorCases)
    func equalAfterthought(operationPassed: operatorCases)
    func fc(original: Double) -> String
    func cf(original: Double) -> String
}
