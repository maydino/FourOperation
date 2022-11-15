//
//  MultiplyVC.swift
//  FourOperation
//
//  Created by Mutlu Aydin on 11/13/22.
//

import UIKit

class MultiplyVC: UIViewController {
    
    //MARK: - Properties
    let allNumbers = [1,2,3,4,5,6,7,8,9]
    var firstNumber = 0
    var secondNumber = 0
    
    //MARK: - Answer Counters
    var wrongAnswerCounter = 0
    var correctAnswerCounter = 0
    
    //MARK: - Import ViewControllers
    let keyboardVC = KeyboardVC()
    let wrongAnswerVC = WrongAnswerVC()
    let calculationVC = CalculationVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: - Additional Methods
        getRandomNumbers()
        
        //MARK: - Add Imported VCs
        add(childViewController: keyboardVC, to: view)
        
        //MARK: - Configurations
        view.backgroundColor = FOColors.backgroundColor
        configureCalculationVC()
        
        //MARK: - Delegate
        keyboardVC.keyboardDelegate = self
    }
    
    func configureCalculationVC() {
        calculationVC.firstRowLabel.text = "\(firstNumber)"
        calculationVC.secondRowLabel.text = "\(secondNumber)"
        calculationVC.operatorLabel.text = " ✖️"
        calculationVC.correctAnswerLabel.text = "Correct Answer: \(correctAnswerCounter)"
        calculationVC.wrongAnswerLabel.text = "Wrong answer: \(wrongAnswerCounter)"
        
        addChild(calculationVC)
        calculationVC.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(calculationVC.view)
        
        NSLayoutConstraint.activate([
            calculationVC.view.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            calculationVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            calculationVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            calculationVC.view.bottomAnchor.constraint(equalTo: keyboardVC.view.topAnchor, constant: 0)
        ])
        
        calculationVC.didMove(toParent: self)
        
    }
    
    // Pick a random number
    func getRandomNumbers() {
        firstNumber = allNumbers.randomElement() ?? 0
        secondNumber = allNumbers.randomElement() ?? 0
    }
}

// For keyboard
extension MultiplyVC: keyboardTextDelegate {
    
    func keyboardTapped(numbers: [Int]) {
        var showNumbersAsString = ""
        
        for i in numbers {
            if i == 10 && showNumbersAsString != "" {
                showNumbersAsString.removeLast()
                continue
            } else if i == 10 {
                continue
            } else if i == 11 {
                showNumbersAsString += "0"
                continue
            } else if i == 12 {
                if (firstNumber * secondNumber) == Int(showNumbersAsString) {
                    correctAnswerCounter += 1
                    showNumbersAsString = ""
                    keyboardVC.numPadNumbers = [Int]()
                    self.viewDidLoad()
                    
                    continue
                    
                } else { // Wrong answer
                    showNumbersAsString = ""
                    wrongAnswerCounter += 1
                    
                    // Present the alert
                    let alert = FOAlertVC(title: "Wrong Answer...", message: "Correct Answer was:", result: "\(firstNumber * secondNumber)")
                    present(alert, animated: true)
                    
                    keyboardVC.numPadNumbers = [Int]()
                    self.viewDidLoad()
                    
                    continue
                }
            } else {
                showNumbersAsString += "\(i)"
            }
        }
        // End of game
        if (wrongAnswerCounter + correctAnswerCounter) >= 5 {
            wrongAnswerCounter = 0
            correctAnswerCounter = 0
            return
        }
        calculationVC.resultLabel.text = showNumbersAsString
    }
}

