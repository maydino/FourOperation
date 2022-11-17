//
//  FOAlertVC.swift
//  FourOperation
//
//  Created by Mutlu Aydin on 11/11/22.
//

import UIKit

class FOAlertVC: UIViewController {

    let containerView = UIView()
    let titleLabel = FOLabel(textAlignment: .center, fontSize: 30)
    let messageLabel = FOBodyLabel(textAlignment: .center)
    let correctResultLabel = FOBodyLabel(textAlignment: .center)
    let alertButton = UIButton()
    
    var alertTitle: String?
    var message: String?
    var result: String?
    
    let padding: CGFloat = 10
    
    init (title: String, message: String, result: String) {
        super .init(nibName: nil, bundle: nil)

        self.alertTitle = title
        self.message = message
        self.result = result

        configureContainerView()
        
        view.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContainerView()
        configureTitleLabel()
        configureMessageLabel()
        configureCorrectResultLabel()
        configureAlertButton()
    }
    
    func configureContainerView() {
        view.addSubview(containerView)
        
        containerView.backgroundColor = FOColors.buttonColor
        containerView.layer.cornerRadius = 20
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = FOColors.buttonColor?.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 39),
            containerView.widthAnchor.constraint(equalToConstant: 7*view.bounds.width/10),
            containerView.heightAnchor.constraint(equalToConstant: 13*view.bounds.height/35),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        ])
    }
    
    func configureTitleLabel() {
        containerView.addSubview(titleLabel)
        titleLabel.text = alertTitle ?? "Wrong Answer"
        titleLabel.textColor = FOColors.textColor
                
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 2*padding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func configureMessageLabel() {
        containerView.addSubview(messageLabel)
        messageLabel.text = message ?? "Correct result is:"
        messageLabel.textColor = FOColors.textColor
                
        NSLayoutConstraint.activate([
            messageLabel.bottomAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            messageLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func configureCorrectResultLabel() {
        containerView.addSubview(correctResultLabel)
        correctResultLabel.text = result ?? "0"
        correctResultLabel.textColor = FOColors.textColor
                
        NSLayoutConstraint.activate([
            correctResultLabel.topAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 10),
            correctResultLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            correctResultLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            correctResultLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func configureAlertButton() {
        containerView.addSubview(alertButton)
        alertButton.setTitle("Ok", for: .normal)
        alertButton.setTitleColor(FOColors.textColor, for: .normal)
        alertButton.titleLabel?.font = .systemFont(ofSize: 25)
        alertButton.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        alertButton.layer.borderWidth = 3
        alertButton.layer.borderColor = FOColors.textColor?.cgColor
        alertButton.layer.cornerRadius = 10
        alertButton.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([
            alertButton.heightAnchor.constraint(equalToConstant: 40),
            alertButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor, constant: 0),
            alertButton.widthAnchor.constraint(equalToConstant: 70),
            alertButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10)
        ])
    }
    
    @objc func dismissViewController() {
        dismiss(animated: true)
    }

}
