//
//  ViewController.swift
//  Calculadora
//
//  Created by Guilherme Rosa on 26/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var calc = Calc()
    var indexOfClickedOpButton: Int?
    @IBOutlet var basicOpButtons: [UIButton]!
    @IBOutlet weak var resultMonitorText: UITextView!
    
    @IBAction func allClearButton(_ sender: UIButton) {
        resetOperationalButton()
        self.calc.clear()
        self.resultMonitorText.text = "0"
    }
    
    @IBAction func exponentialButton(_ sender: UIButton) {
        updateResultMonitor(value: self.calc.exponential(for: resultMonitorText.text.toInt()))
    }
    
    @IBAction func squareButton(_ sender: UIButton) {
        updateResultMonitor(value: self.calc.square(for: resultMonitorText.text.toDouble()))
    }
    
    @IBAction func equalsButton(_ sender: UIButton) {
        updateResultMonitor(value: self.calc.operationResult(for: self.resultMonitorText.text.toInt()))
    }
    
    @IBAction func touchDivisionButton(_ sender: UIButton) {
        indexOfClickedOpButton = basicOpButtons.firstIndex(of: sender)
        activeOperationalButton()
        self.calc.choose(number: self.resultMonitorText.text.toInt(), for: .division)
    }
    
    @IBAction func touchMultiplyButton(_ sender: UIButton) {
        indexOfClickedOpButton = basicOpButtons.firstIndex(of: sender)
        activeOperationalButton()
        self.calc.choose(number: self.resultMonitorText.text.toInt(), for: .multiply)
    }
    
    @IBAction func touchMinusButton(_ sender: UIButton) {
        indexOfClickedOpButton = basicOpButtons.firstIndex(of: sender)
        activeOperationalButton()
        self.calc.choose(number: self.resultMonitorText.text.toInt(), for: .minus)
    }
    
    @IBAction func touchPlusButton(_ sender: UIButton) {
        indexOfClickedOpButton = basicOpButtons.firstIndex(of: sender)
        activeOperationalButton()
        self.calc.choose(number: self.resultMonitorText.text.toInt(), for: .plus)
    }
    
    @IBAction func touchUnoperationalButton(_ sender: UIButton) {
        if indexOfClickedOpButton != nil {
            updateResultMonitor(value: sender.currentTitle ?? "0")
            resetOperationalButton()
        } else {
            if self.resultMonitorText.text == "0" {
                updateResultMonitor(value: sender.currentTitle ?? "0")
            } else {
                updateResultMonitor(value: self.resultMonitorText.text + (sender.currentTitle ?? "0"))
            }
        }
    }
    
    func activeOperationalButton(){
        if let indexButton = indexOfClickedOpButton {
            basicOpButtons[indexButton].backgroundColor = .white
            basicOpButtons[indexButton].setTitleColor(#colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1), for: .normal)
        }
    }
    
    func resetOperationalButton(){
        if let indexButton = indexOfClickedOpButton {
            indexOfClickedOpButton = nil
            basicOpButtons[indexButton].backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            basicOpButtons[indexButton].setTitleColor(.white, for: .normal)
        }
    }
    
    func  updateResultMonitor(value: String){
        self.resultMonitorText.text = value;
    }
    
}

