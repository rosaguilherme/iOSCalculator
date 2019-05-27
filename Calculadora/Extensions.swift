//
//  Extensions.swift
//  Calculadora
//
//  Created by Guilherme Rosa on 26/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

extension String {
    
    mutating func toInt() -> Int {
        return Int(self) ?? 0
    }
    
    mutating func toDouble() -> Double {
        return Double(self) ?? 0
    }

}
