//  Calculator - ViewController.swift
//  Created by LJ. 
//  Copyright © yagom. All rights reserved.

import UIKit

class ViewController: UIViewController {
    var inputNumberArray: [String] = []
    var calculatedStringValue: String = ""
    
    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBAction func touchNumber(_ sender: UIButton) {
        inputNumberArray.append(sender.currentTitle ?? "")
        
        if inputNumberArray.count == 1 && inputNumberArray[0] == "."  {
            inputNumberArray.insert("0", at: 0)
        } else if inputNumberArray.count == 2 {
            guard inputNumberArray[1] != "." else {
                numberLabel.text = inputNumberArray.joined()
                return
            }
            switch inputNumberArray[0] {
            case "0":
                inputNumberArray.removeFirst()
            case ".":
                inputNumberArray.insert("0", at: 0)
            default:
                break
            }
        } else if inputNumberArray.count > 2 {
            if inputNumberArray[inputNumberArray.count-1] == "."
                && inputNumberArray.contains(".") {
                inputNumberArray.removeLast()
            }
        }
        numberLabel.text = inputNumberArray.joined()
    }
    
    @IBAction func touchOperator(_ sender: UIButton) {
        switch sender.currentTitle {
        case "AC":
            inputNumberArray = []
            numberLabel.text = inputNumberArray.joined() //중복
        case "CE":
            inputNumberArray.removeLast()
            numberLabel.text = inputNumberArray.joined() //중복
        case "⁺⁄₋":
            if signLabel.text != "+" {
               signLabel.text = "+"
            } else {
                signLabel.text = "−"
            }
        case "+","−","×","÷":
            inputNumberArray.append(sender.currentTitle ?? "")
            signLabel.text = sender.currentTitle
            numberLabel.text = inputNumberArray.joined()  //중복
        case "=":
            if let input = numberLabel.text {
                var convertedFormula: Formula = ExpressionParser.parse(from: input)
                do {
                    let calculatedDoubleValue: Double = try convertedFormula.result() ?? 0
                    calculatedStringValue = String(calculatedDoubleValue) //언래핑 후 string변환 가능
                } catch OccuredError.emptyOperator {
                    print("error")
                } catch {
                }
                numberLabel.text = calculatedStringValue
            }
            inputNumberArray = []
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

