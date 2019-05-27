//
//  Calc.swift
//  Calculadora
//
//  Created by Guilherme Rosa on 26/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

class Calc {
    
    var result: String?
    var firstNumberOfOperation: Int?
    var operationType: OperationType?
    
    func choose(number: Int, for operation: OperationType) {
        self.firstNumberOfOperation = number
        self.operationType = operation
    }
    
    func clear() {
        self.operationType = nil
        self.firstNumberOfOperation = nil
    }
    
    func exponential(for number: Int) -> String {
        return "\(number * number)"
    }
    
    func square(for number: Double) -> String {
        return "\(number.squareRoot())"
    }
    
    func operationResult(for number: Int) -> String {
        if let firstNumber = firstNumberOfOperation, let operation = operationType {
            switch operation {
            case .plus:
                return sum(firstNumber: firstNumber, secondNumber: number)
            case .minus:
                return subtract(firstNumber: firstNumber, secondNumber: number)
            case .division:
                return divide(firstNumber: firstNumber, secondNumber: number)
            case .multiply:
                return multiply(firstNumber: firstNumber, secondNumber: number)
            default:
                return "0"
            }
        }
        
        return "0"
    }
    
    func sum(firstNumber: Int, secondNumber: Int) -> String {
        return "\(firstNumber + secondNumber)"
    }
    
    func subtract(firstNumber: Int, secondNumber: Int) -> String {
        return "\(firstNumber - secondNumber)"
    }
    
    func divide(firstNumber: Int, secondNumber: Int) -> String {
        return "\(firstNumber / secondNumber)"
    }
    
    func multiply(firstNumber: Int, secondNumber: Int) -> String {
        return "\(firstNumber * secondNumber)"
    }
    
}

enum OperationType {
    case minus
    case plus
    case division
    case multiply
}
