//
//  CalculationVC.swift
//  FourOperations
//
//  Created by Mutlu Aydin on 11/14/22.
//

import UIKit

class CalculationVC: UIViewController {

    //MARK: - Properties
    let numbersFontSize: CGFloat = 60
    
    //MARK: - View Layers
    let firstRowLabel = FOTitleLabel()
    let secondRowLabel = FOTitleLabel()
    let operatorLabel = FOTitleLabel()
    let lineLabel = UILabel()
    let resultLabel = FOTitleLabel()
    let calculationView = FOView()

    let resultStackView = FOStackView()
    let correctAnswerLabel = FOLabel(textAlignment: .left, fontSize: 22)
    let wrongAnswerLabel = FOLabel(textAlignment: .left, fontSize: 22)
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - Configurations
        configureTextField()

    }
    
    func configureTextField() {

        //MARK: - Second Row Configure
        operatorLabel.textAlignment = .left
        operatorLabel.backgroundColor = .clear
         
        //MARK: - Line Label Configure
        lineLabel.translatesAutoresizingMaskIntoConstraints = false
        lineLabel.layer.borderColor = FOColors.backgroundColor?.cgColor
        lineLabel.layer.borderWidth = 3
        
        //MARK: - Result Row Configure
        calculationView.backgroundColor = FOColors.buttonColor
        calculationView.layer.cornerRadius = 20
        calculationView.layer.masksToBounds = true
        calculationView.alpha = 0.5

        //MARK: - Calculation View SubViews
        calculationView.addSubview(firstRowLabel)
        calculationView.addSubview(secondRowLabel)
        calculationView.addSubview(operatorLabel)
        calculationView.addSubview(lineLabel)
        calculationView.addSubview(resultLabel)
        
        //MARK: - Result Stack View Components
        correctAnswerLabel.textAlignment = .center

        wrongAnswerLabel.textAlignment = .center
        
        resultStackView.alpha = 0.5
        resultStackView.addArrangedSubview(correctAnswerLabel)
        resultStackView.addArrangedSubview(wrongAnswerLabel)
        
        view.addSubview(calculationView)
        view.addSubview(resultStackView)

        NSLayoutConstraint.activate([
            //MARK: - Calculation View Constraints
            calculationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            calculationView.bottomAnchor.constraint(equalTo: resultStackView.topAnchor, constant: -15),
            calculationView.widthAnchor.constraint(equalToConstant: 7*view.bounds.width/10),
            calculationView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),

            //MARK: - First Row Label
            firstRowLabel.topAnchor.constraint(equalTo: calculationView.topAnchor, constant: 0),
            firstRowLabel.heightAnchor.constraint(equalToConstant: view.bounds.height/8),
            firstRowLabel.leadingAnchor.constraint(equalTo: calculationView.leadingAnchor, constant: 0),
            firstRowLabel.trailingAnchor.constraint(equalTo: calculationView.trailingAnchor, constant: -20),
            
            //MARK: - Second Row Label
            secondRowLabel.topAnchor.constraint(equalTo: firstRowLabel.bottomAnchor, constant: 0),
            secondRowLabel.heightAnchor.constraint(equalToConstant: view.bounds.height/8),
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
            resultLabel.heightAnchor.constraint(equalToConstant: view.bounds.height/8),
            resultLabel.leadingAnchor.constraint(equalTo: calculationView.leadingAnchor, constant: 0),
            resultLabel.trailingAnchor.constraint(equalTo: calculationView.trailingAnchor, constant: -20),
                        
            //MARK: - Result Stack View Constraints
            resultStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10),
            resultStackView.topAnchor.constraint(equalTo: calculationView.bottomAnchor, constant: 10),
            resultStackView.widthAnchor.constraint(equalToConstant: view.bounds.width/2),
            resultStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ])
    }
    
}
