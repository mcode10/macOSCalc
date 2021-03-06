//
//  ViewController.swift
//  macOS Calculator
//
//  Created by Manas Paranjape on 5/25/19.
//  Copyright © 2019 DesignX6. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

var calcEngine = getCalcEngine()
var answer = ""
var operation:operatorCases = .add
var inDarkMode: Bool {
    let mode = UserDefaults.standard.string(forKey: "AppleInterfaceStyle")
    return mode == "Dark"
}
    
    @IBOutlet var display_Panel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
        if !inDarkMode {
            view.layer?.backgroundColor = NSColor.white.cgColor
        }
        assert(answer == "" && operation == .add && display_Panel.stringValue == "0", "We messed up our set-up.")
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func clear(_ sender: Any) {
        calcEngine.clear()
        display_Panel.stringValue = "0"
        answer = ""
    }
    
    @IBAction func positiveNegative(_ sender: Any) {
        display_Panel.stringValue = String(calcEngine.positiveNegative(original: Double(display_Panel.stringValue)!))
        self.clear(sender)
        assert(display_Panel.stringValue == "0" && answer == "")
    }
    
    @IBAction func fc(_ sender: NSButton) {
        display_Panel.stringValue = calcEngine.fc(original: Double(display_Panel.stringValue)!)
    }
    
    @IBAction func cf(_ sender: NSButton) {
        display_Panel.stringValue = calcEngine.cf(original: Double(display_Panel.stringValue)!)
    }
    
    
    @IBAction func operators(_ sender: NSButtonCell) {
        //TODO Make a library full of code linked to CalcEngine and
        // CalcEngineProtocol
        let operand: Double = Double(display_Panel.stringValue)!
        if answer == ""{
            switch sender.tag {
            case 23:
                operation = .add
            case 22:
                operation = .subtract
            case 21:
                operation = .multiply
            case 20:
                operation = .divide
            default:
                assert(display_Panel.stringValue != "0", "The user didn't press anything.")
                assert(false, "This shouldn't be happening")
                print("This shouldn't be happening")
                sleep(5)
                exit(0)
            }
            calcEngine.calcEngineInput(operand: operand, operationPassed: operation)
            display_Panel.stringValue = "0"
        } else {
            switch sender.tag {
            case 23:
                operation = .add
            case 22:
                operation = .subtract
            case 21:
                operation = .multiply
            case 20:
                operation = .divide
            default:
                assert(display_Panel.stringValue != "0", "The user didn't press anything.")
                assert(false, "This shouldn't be happening")
                print("This shouldn't be happening")
                sleep(5)
                exit(0)
            }
            calcEngine.equalAfterthought(operationPassed: operation)
            answer = ""
            display_Panel.stringValue = "0"
        }
    }
    
    @IBAction func percent(_ sender: Any) {
        display_Panel.stringValue = String(calcEngine.percenter(original: Double(display_Panel.stringValue)!))
        self.clear(sender)
        assert(display_Panel.stringValue == "0" && answer == "")
    }
    
    @IBAction func equalPressed(_ sender: Any) {
        answer = String(calcEngine.equalPressed(operand: Double(display_Panel.stringValue)!))
        display_Panel.stringValue = answer
    }
    
    @IBAction func numbers(_ sender: NSButton) {
        if display_Panel.stringValue == "0" {
            display_Panel.stringValue = String(sender.tag)
        } else {
            display_Panel.stringValue = display_Panel.stringValue + String(sender.tag)
        }
    }
    
    
}
