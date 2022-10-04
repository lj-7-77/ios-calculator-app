//  Calculator - ViewController.swift
//  Created by LJ. 
//  Copyright © yagom. All rights reserved.

import UIKit

class ViewController: UIViewController {
    var totalFormula: [String] = []
    var currentInputNumber: String = ""
    var calculatedResult: String = ""
    
    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var horizontalStackView: UIStackView!
    @IBOutlet weak var verticalStackView: UIStackView!
    
    @IBAction func touchNumber(_ sender: UIButton) {
        currentInputNumber += sender.currentTitle ?? ""
        numberLabel.text = currentInputNumber
    }
    
    @IBAction func touchOperator(_ sender: UIButton) {
        switch sender.currentTitle {
        case "AC":
            totalFormula = []
            signLabel.text = ""
            numberLabel.text = ""
            currentInputNumber = ""
            horizontalStackView.removeArrangedSubview(view)
        case "CE":
            totalFormula = []
        case "⁺⁄₋":
            if signLabel.text != "+" {
               signLabel.text = "+"
            } else {
                signLabel.text = "−"
            }
        case "+","−","×","÷":
            totalFormula.append(signLabel.text ?? "")
            totalFormula.append(currentInputNumber)
            print("totalFormula: \(totalFormula)")
            
            numberLabel.text = ""
            addStackView()
            
            signLabel.text = sender.currentTitle
            currentInputNumber = ""
        case "=":
            signLabel.text = ""
            numberLabel.text = ""
            currentInputNumber = ""
            let input: String = totalFormula.joined()
            print(input)
            totalFormula = []
        default:
            break
        }
    }
    
    func addStackView() {
        let newStackView: UIStackView = UIStackView()
        let verticalStackSignLabel: UILabel = UILabel()
        let verticalStackNumberLabel: UILabel = UILabel()
        
        verticalStackSignLabel.text = signLabel.text ?? ""
        verticalStackNumberLabel.text = currentInputNumber
        verticalStackSignLabel.textColor = .white
        verticalStackNumberLabel.textColor = .white
        
        newStackView.addArrangedSubview(verticalStackSignLabel)
        newStackView.addArrangedSubview(verticalStackNumberLabel)
        horizontalStackView.addArrangedSubview(newStackView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
