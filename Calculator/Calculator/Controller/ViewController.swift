//  Calculator - ViewController.swift
//  Created by LJ. 
//  Copyright © yagom. All rights reserved.

import UIKit

class ViewController: UIViewController {
    var inputNumberArray: [String] = []
    var displayResultValue: String = ""
    
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

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

