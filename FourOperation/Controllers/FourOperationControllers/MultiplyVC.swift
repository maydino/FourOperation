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
    let calculationVC = CalculationVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: FOFont.textFontNormal, size: 25)!]
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
        calculationVC.operatorLabel.text = " x"
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
                    if (self.correctAnswerCounter + self.wrongAnswerCounter) >= NumberOfQuestions.numberOfQuestions {
                        self.newGame()
                    }
                    self.viewDidLoad()
                                        
                } else { // Wrong answer
                    showNumbersAsString = ""
                    wrongAnswerCounter += 1
                    
                    keyboardVC.numPadNumbers = [Int]()
                    
                    // Reload the page
                    self.viewDidLoad()
                    
                    // Present the alert
                    let alert = FOAlertVC(title: "Wrong Answer...", message: "Correct Answer was:", result: "\(firstNumber * secondNumber)")
                    
                    if (self.correctAnswerCounter + self.wrongAnswerCounter) >= NumberOfQuestions.numberOfQuestions {
                        alert.alertButton.isHidden = true
                    }
                    
                    present(alert, animated: true)
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        if (self.correctAnswerCounter + self.wrongAnswerCounter) >= NumberOfQuestions.numberOfQuestions {
                            
                            self.dismiss(animated: true, completion: {
                                self.newGame()
                            })
                        }
                    }

                }
            } else {
                showNumbersAsString += "\(i)"
            }
        }
        calculationVC.resultLabel.text = showNumbersAsString
    }
    
    func newGame() {
        self.gameEnded(correct: self.correctAnswerCounter)
        wrongAnswerCounter = 0
        correctAnswerCounter = 0
        calculationVC.correctAnswerLabel.text = "Correct answer: \(correctAnswerCounter)"
        calculationVC.wrongAnswerLabel.text = "Wrong answer: \(correctAnswerCounter)"
    }
    
}

