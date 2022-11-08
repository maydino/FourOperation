//
//  PlusVC.swift
//  FourOperation
//
//  Created by Mutlu Aydin on 11/3/22.
//

import UIKit

class PlusVC: UIViewController {
    
    //MARK: - Properties
    let allNumbers = [1,2,3,4,5,6,7,8,9]
    var firstNumber = 0
    var secondNumber = 0
    
    //MARK: - Answer Counters
    var wrongAnswerCounter = 0
    var rightAnswerCounter = 0

    //MARK: - Import ViewControllers
    let keyboardVC = KeyboardVC()
    
    //MARK: - View Layers
    let firstRowLabel = FOTitleLabel()
    let secondRowLabel = FOTitleLabel()
    let operatorLabel = FOTitleLabel()
    let lineLabel = UILabel()
    let resultLabel = FOTitleLabel()
    let calculationView = FOView()
   
    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK: - Add Imported VCs
        add(keyboardVC, frame: CGRect(x: 0, y: 500, width: view.bounds.width, height: view.bounds.height-500))
        
        //MARK: - Additional Methods
        getRandomNumbers()
        
        //MARK: - Configurations
        configureTextField()
        view.backgroundColor = .systemMint

        //MARK: - Delegate
        keyboardVC.keyboardDelegate = self
    }
    
    func configureTextField() {
        
        //MARK: - First Row Configure
        firstRowLabel.text = "\(firstNumber)"

        //MARK: - Second Row Configure
        secondRowLabel.text = "\(secondNumber)"
        
        //MARK: - Second Row Configure
        operatorLabel.text = "+"
        operatorLabel.textAlignment = .left
        operatorLabel.backgroundColor = .clear
        
        //MARK: - Line Label Configure
        lineLabel.translatesAutoresizingMaskIntoConstraints = false
        lineLabel.layer.borderColor = UIColor.white.cgColor
        lineLabel.layer.borderWidth = 3
        
        //MARK: - Result Row Configure
        
        calculationView.backgroundColor = .systemPink
        calculationView.translatesAutoresizingMaskIntoConstraints = false
        calculationView.layer.cornerRadius = 40
        calculationView.layer.masksToBounds = true

        //MARK: - StackView SubViews
        calculationView.addSubview(firstRowLabel)
        calculationView.addSubview(secondRowLabel)
        calculationView.addSubview(operatorLabel)
        calculationView.addSubview(lineLabel)
        calculationView.addSubview(resultLabel)
        
        view.addSubview(calculationView)

        NSLayoutConstraint.activate([
            //MARK: - First Row Label
            firstRowLabel.topAnchor.constraint(equalTo: calculationView.topAnchor, constant: 0),

            firstRowLabel.heightAnchor.constraint(equalToConstant: 80),
            firstRowLabel.leadingAnchor.constraint(equalTo: calculationView.leadingAnchor, constant: 0),
            firstRowLabel.trailingAnchor.constraint(equalTo: calculationView.trailingAnchor, constant: -20),
            
            //MARK: - Second Row Label
            secondRowLabel.topAnchor.constraint(equalTo: firstRowLabel.bottomAnchor, constant: 0),

            secondRowLabel.heightAnchor.constraint(equalToConstant: 80),
            secondRowLabel.leadingAnchor.constraint(equalTo: calculationView.leadingAnchor, constant: 0),
            secondRowLabel.trailingAnchor.constraint(equalTo: calculationView.trailingAnchor, constant: -20),
            
            //MARK: - Operator Label
            operatorLabel.heightAnchor.constraint(equalToConstant: 30),
            operatorLabel.bottomAnchor.constraint(equalTo: secondRowLabel.bottomAnchor, constant: 0),
            operatorLabel.leadingAnchor.constraint(equalTo: calculationView.leadingAnchor, constant: 0),
            operatorLabel.trailingAnchor.constraint(equalTo: calculationView.trailingAnchor, constant: 0),
            
            //MARK: - Result Label Row Label
            lineLabel.heightAnchor.constraint(equalToConstant: 6),
            lineLabel.topAnchor.constraint(equalTo: operatorLabel.bottomAnchor, constant: 0),
            lineLabel.leadingAnchor.constraint(equalTo: calculationView.leadingAnchor, constant: 0),
            lineLabel.trailingAnchor.constraint(equalTo: calculationView.trailingAnchor, constant: 0),
            
            //MARK: - Result Label Row Label
            resultLabel.bottomAnchor.constraint(equalTo: calculationView.bottomAnchor, constant: 0),
            resultLabel.heightAnchor.constraint(equalToConstant: 70),
            resultLabel.leadingAnchor.constraint(equalTo: calculationView.leadingAnchor, constant: 0),
            resultLabel.trailingAnchor.constraint(equalTo: calculationView.trailingAnchor, constant: -20),

            //MARK: - Stack View Constraints
            calculationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            calculationView.widthAnchor.constraint(equalToConstant: 7*view.bounds.width/10),
            calculationView.heightAnchor.constraint(equalToConstant: 250),
            calculationView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ])
    }
    
    // Pick a random number
    func getRandomNumbers() {
        firstNumber = allNumbers.randomElement() ?? 0
        secondNumber = allNumbers.randomElement() ?? 0
    }
}

extension PlusVC: keyboardTextDelegate {
    func keyboardTapped(numbers: [Int]) {
        var showNumbersAsString = ""
        
        print(">>>>>>>>>")
        
        for i in numbers {
            if (wrongAnswerCounter + rightAnswerCounter) >= 10 {
                wrongAnswerCounter = 0
                rightAnswerCounter = 0
                print("game end")
                return
            }
            if i == 10 && showNumbersAsString != "" {
                showNumbersAsString.removeLast()
                continue
            } else if i == 10 {
                continue
            } else if i == 11 {
                showNumbersAsString += "0"
                continue
            } else if i == 12 {
                if (firstNumber + secondNumber) == Int(showNumbersAsString) {
                    print("You got it Mutlu!")
                    rightAnswerCounter += 1
                    showNumbersAsString = ""
                    keyboardVC.numPadNumbers = [Int]()
                    self.viewDidLoad()

                    continue
                } else {
                    showNumbersAsString = ""
                    wrongAnswerCounter += 1
                    print("Oppss wrong asnwer, try again...")
                    keyboardVC.numPadNumbers = [Int]()
                    self.viewDidLoad()

                    continue
                }
            } else {
                showNumbersAsString += "\(i)"
            }
        }
        resultLabel.text = showNumbersAsString
    }

}

