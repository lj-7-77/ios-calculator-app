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
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var horizontalStackView: UIStackView!
    @IBOutlet weak var verticalStackView: UIStackView!  //미사용
    
    @IBAction func touchNumber(_ sender: UIButton) {
        currentInputNumber += sender.currentTitle ?? ""
        numberLabel.text = currentInputNumber
    }

    @IBAction func touchOperator(_ sender: UIButton) {
        switch sender.currentTitle {
        case "AC":
            signLabel.text = ""
            numberLabel.text = ""
            currentInputNumber = ""
            totalFormula = []
            removeAllStackView()
        case "CE":
            if totalFormula.count > 1 {
                removeLastStackView()
            }
        case "⁺⁄₋":
            //피연산자의 +/-값을 바꾸는 것
            if signLabel.text != "+" {
               signLabel.text = "+"
            } else {
                signLabel.text = "−"
            }
        case "+","−","×","÷":
            numberLabel.text = ""
            if currentInputNumber != "" {
                addToTotalFormula()
                addStackView()
                currentInputNumber = ""
            }
            signLabel.text = sender.currentTitle
            print("contentSize:\(scrollView.contentSize.height)")
            print("bounds:\(scrollView.bounds.height)")
            view.layoutIfNeeded()
            scrollView.setContentOffset(CGPoint(x: 0.0,
                                                y: scrollView.contentSize.height - scrollView.bounds.size.height), animated: true)
            print("scrollView.contentOffset: \(scrollView.contentOffset)")
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
    
    func removeAllStackView() {
        horizontalStackView.subviews.forEach { value in
            value.isHidden = true
        }
    }
    
    func removeLastStackView() {
        guard let lastStackView: UIView = horizontalStackView.arrangedSubviews.last else {
            return
        }
        lastStackView.removeFromSuperview()
        totalFormula.removeLast()
        totalFormula.removeLast()
    }
    
    func addToTotalFormula() {
        if let signLabelText = signLabel.text, signLabel.text != "" {
            totalFormula.append(signLabelText)
        }
        totalFormula.append(currentInputNumber)
        print("totalFormula: \(totalFormula)")
    }
    
    func addStackView() {
        let newStackView: UIStackView = UIStackView()
        let verticalStackSignLabel: UILabel = UILabel()
        let verticalStackNumberLabel: UILabel = UILabel()
        
        guard let signLabelText: String = signLabel.text else {
            return
        }
        verticalStackSignLabel.text = signLabelText
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
