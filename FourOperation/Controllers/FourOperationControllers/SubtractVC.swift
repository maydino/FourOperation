//
//  SubtractVC.swift
//  FourOperation
//
//  Created by Mutlu Aydin on 11/12/22.
//

import UIKit

class SubtractVC: UIViewController {
    
    //MARK: - Properties
    let allNumbers = [1,2,3,4,5,6,7,8,9]
    var firstNumber = 0
    var secondNumber = 0
    var randomNumberIndex = 0
    
    //MARK: - Answer Counters
    var wrongAnswerCounter = 0
    var correctAnswerCounter = 0
    
    //MARK: - Sub ViewControllers
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
        calculationVC.operatorLabel.text = " -"
        calculationVC.operatorLabel.font = .systemFont(ofSize: 100)
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
        
        randomNumberIndex = Int.random(in: 0..<9)
        print("hellooooo \(randomNumberIndex)")
        secondNumber = allNumbers[randomNumberIndex]
        firstNumber = Int.random(in: (randomNumberIndex+1)..<10)
        
    }
}

// For keyboard
extension SubtractVC: keyboardTextDelegate {
    
    func keyboardTapped(numbers: [Int]) {
        var showNumbersAsString = ""
        
        print(">>>>>>>>>")
        
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
                if (firstNumber - secondNumber) == Int(showNumbersAsString) {
                    print("You got it Mutlu!")
                    correctAnswerCounter += 1
                    showNumbersAsString = ""
                    keyboardVC.numPadNumbers = [Int]()
                    self.viewDidLoad()
                    
                    continue
                } else {
                    showNumbersAsString = ""
                    wrongAnswerCounter += 1
                    
                    // Present the alert
                    let alert = FOAlertVC(title: "Wrong Answer...", message: "Correct Answer was:", result: "\(firstNumber - secondNumber)")
                    present(alert, animated: true)
                    
                    print("Oppss wrong asnwer, try again...")
                    keyboardVC.numPadNumbers = [Int]()
                    
                    // Reload the page
                    self.viewDidLoad()
                    
                    continue
                }
            } else {
                showNumbersAsString += "\(i)"
            }
        }
        if (wrongAnswerCounter + correctAnswerCounter) >= 5 {
            wrongAnswerCounter = 0
            correctAnswerCounter = 0
            print("game end")
            return
        }
        calculationVC.resultLabel.text = showNumbersAsString
    }
    
}

