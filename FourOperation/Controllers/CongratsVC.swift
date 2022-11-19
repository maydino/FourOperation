//
//  CongratsVC.swift
//  FourOperation
//
//  Created by Mutlu Aydin on 11/17/22.
//

import UIKit
import SwiftConfettiView

class CongratsVC: UIViewController {
    
    //View Layers
    let congratsLabel = FOTitleLabel()
    let correctAnswersLabel = FOTitleLabel()
    let correctAnswersCountLabel = FOTitleLabel()
    let wrongAnswersLabel = FOLabel()

    let confettiView = SwiftConfettiView(frame: CGRect(x: UIScreen.main.bounds.width/2, y: 0, width: 0, height: 0))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Configure Views
        configureCongratsLabel()
        configureCorrectAnswersLabel()
        configureCorrectAnswersCountLabel()
        configureConfetti()
        view.backgroundColor = FOColors.backgroundColor
    }
    
    func configureCongratsLabel() {
        congratsLabel.font = .systemFont(ofSize: 30)
        congratsLabel.textAlignment = .center
        congratsLabel.text = "Congrats!"
        view.addSubview(congratsLabel)
        
        NSLayoutConstraint.activate([
            congratsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            congratsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            congratsLabel.heightAnchor.constraint(equalToConstant: 200),
            congratsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50)
        ])
    }
    
    func configureCorrectAnswersLabel() {
        correctAnswersLabel.font = .systemFont(ofSize: 30)
        correctAnswersLabel.textAlignment = .center
        correctAnswersLabel.text = "Your Score:"
        view.addSubview(correctAnswersLabel)
        
        NSLayoutConstraint.activate([
            correctAnswersLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            correctAnswersLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            correctAnswersLabel.heightAnchor.constraint(equalToConstant: 80),
            correctAnswersLabel.topAnchor.constraint(equalTo: congratsLabel.bottomAnchor, constant: 20)
        ])
    }
    
    func configureCorrectAnswersCountLabel() {
        correctAnswersCountLabel.font = .systemFont(ofSize: 60)
        correctAnswersCountLabel.textAlignment = .center
        view.addSubview(correctAnswersCountLabel)
        
        NSLayoutConstraint.activate([
            correctAnswersCountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            correctAnswersCountLabel.widthAnchor.constraint(equalToConstant: 4*view.bounds.width/5),
            correctAnswersCountLabel.heightAnchor.constraint(equalToConstant: 80),
            correctAnswersCountLabel.topAnchor.constraint(equalTo: correctAnswersLabel.bottomAnchor, constant: 10)
        ])
    }
    
    func configureConfetti() {
        confettiView.type = .confetti
        confettiView.intensity = 0.5

        view.addSubview(confettiView)
        confettiView.startConfetti()
    }
}
