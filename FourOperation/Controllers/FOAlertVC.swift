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
    
    var alertTitle: String?
    var message: String?
    
    let padding: CGFloat = 10
    
    init (title: String) {
        super .init(nibName: nil, bundle: nil)

        self.alertTitle = title
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.cellColor
        configureContainerView()
        configureTitleLabel()
        configureMessageLabel()
    }
    
    func configureContainerView() {
        view.addSubview(containerView)
        
        containerView.backgroundColor = AppColors.buttonColor
        containerView.layer.cornerRadius = 12
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = AppColors.buttonColor?.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            containerView.widthAnchor.constraint(equalToConstant: view.bounds.width/1.5),
            containerView.heightAnchor.constraint(equalToConstant: view.bounds.height/3)
        ])
    }
    
    func configureTitleLabel() {
        containerView.addSubview(titleLabel)
        titleLabel.text = alertTitle ?? "Wrong Answer"
        titleLabel.textColor = AppColors.textColor
                
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 2*padding),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func configureMessageLabel() {
        containerView.addSubview(messageLabel)
        messageLabel.text = alertTitle ?? "0"
        messageLabel.textColor = AppColors.textColor
                
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 0),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
            messageLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    @objc func dismissViewController() {
        dismiss(animated: true)
    }

}
