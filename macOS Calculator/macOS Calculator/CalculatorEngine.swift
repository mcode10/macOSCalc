//
//  CalculatorEngine.swift
//  iOS Calculator
//
//  Created by Manas Paranjape on 12/15/18.
//  Copyright © 2018 DesignX6. All rights reserved.
//

import Foundation


class CalculatorEngine:CalcEngineProtocol {
    var currentValue:Double = 0;
    var operation:operatorCases = .add;
    func clear() {
        operation = .add;
        currentValue = 0
    }
    func fc(original: Double) -> String {
        return String((original - 32)/1.8)
    }
    func cf(original: Double) -> String {
        return String(original * 1.8 + 32)
    }
    func equalAfterthought(operationPassed: operatorCases) {
        operation = operationPassed
    }
    func equalPressed(operand: Double) -> Double {
        print(currentValue, "I am from equalPressed")
        print(operation, "I am from equalPressed")
        switch operation {
        case .add:
            currentValue = add(operand1: currentValue, operand2: operand)
        case .subtract:
            currentValue = subtract(operand1: currentValue, operand2: operand)
        case .divide:
            currentValue = division(operand1: currentValue, operand2: operand)
        case .multiply:
            currentValue = multiply(operand1: currentValue, operand2: operand)
        }
        print(currentValue, "I am from equalPressed")
        print(operation, "I am from equalPressed")
        return currentValue
    }
    func percenter(original: Double) -> Double {
        return (original/100)
    }
    func positiveNegative(original: Double) -> Double {
        let original2 = original * Double(-1)
        return original2
    }
    func add(operand1: Double, operand2: Double) -> Double {
        return operand2 + operand1
    }
    func subtract(operand1: Double, operand2: Double) -> Double {
        return operand1 - operand2
    }
    func multiply(operand1: Double, operand2: Double) -> Double {
        return operand2 * operand1
    }
    func division(operand1: Double, operand2: Double) -> Double {
        if operand2 == Double(0) {
            print("You cannot divide by zero.")
        }
        return operand1 / operand2
    }
    func calcEngineInput(operand: Double, operationPassed: operatorCases) {
        if currentValue == Double(0) {
            assert(operation == .add, "We changed the operand without the user doing anything.")
            operation = operationPassed
            currentValue = operand
            print(currentValue, "I am from CalcEngineInput")
            print(operation, "I am from CalcEngineInput")
        } else {
            print(currentValue, "I am from CalcEngineInput")
            switch operation {
            case .add:
                currentValue = add(operand1: currentValue, operand2: operand)
            case .subtract:
                currentValue = subtract(operand1: currentValue, operand2: operand)
            case .multiply:
                currentValue = multiply(operand1: currentValue, operand2: operand)
            case .divide:
                currentValue = division(operand1: currentValue, operand2: operand)
            }
            print(currentValue, "I am from CalcEngineInput")
            operation = operationPassed
            print(operation, "I am from CalcEngineInput")
        }
    }
}
