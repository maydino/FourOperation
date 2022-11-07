//
//  PlusVC.swift
//  FourOperation
//
//  Created by Mutlu Aydin on 11/3/22.
//

import UIKit

class PlusVC: UIViewController {
    
    let allValues = [0,1,2,3,4,5,6,7,8,9]

    let keyboardVC = KeyboardVC()
    
    let firstRowLabel = FOTitleLabel()
    let secondRowLabel = FOTitleLabel()
    let operatorLabel = FOTitleLabel()
    let lineLabel = UILabel()

    let resultLabel = FOTitleLabel()
    
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemMint
        
        add(keyboardVC, frame: CGRect(x: 0, y: 500, width: view.bounds.width, height: view.bounds.height-500))
        configureTextField()
        keyboardVC.keyboardDelegate = self
    }
    
    func configureTextField() {
        
        //MARK: - First Row Configure
        firstRowLabel.text = "\(allValues.randomElement() ?? 0)"
        firstRowLabel.backgroundColor = .red

        //MARK: - Second Row Configure
        secondRowLabel.text = "\(allValues.randomElement() ?? 0)"
        secondRowLabel.backgroundColor = .brown
        
        //MARK: - Second Row Configure
        operatorLabel.text = "+"
        operatorLabel.textAlignment = .left
        
        //MARK: - Line Label Configure
        lineLabel.translatesAutoresizingMaskIntoConstraints = false
        lineLabel.layer.borderColor = UIColor.white.cgColor
        lineLabel.layer.borderWidth = 3
        
        //MARK: - Result Row Configure
        resultLabel.backgroundColor = .darkGray
        
        

        //MARK: - Stack View Row Configure
        stackView.backgroundColor = .systemPink
        stackView.alignment = UIStackView.Alignment.trailing
        stackView.spacing = 20
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution = UIStackView.Distribution.equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false

        stackView.addArrangedSubview(firstRowLabel)
        stackView.addArrangedSubview(secondRowLabel)
        stackView.addArrangedSubview(operatorLabel)
        stackView.addArrangedSubview(lineLabel)
        stackView.addArrangedSubview(resultLabel)
        
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            
            //MARK: - First Row Label
            firstRowLabel.heightAnchor.constraint(equalToConstant: 50),
            firstRowLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0),
            firstRowLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0),
            
            //MARK: - Second Row Label
            secondRowLabel.heightAnchor.constraint(equalToConstant: 50),
            secondRowLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0),
            secondRowLabel.trailingAnchor.constraint(equalTo: secondRowLabel.trailingAnchor, constant: 0),
            
            //MARK: - Operator Label
            operatorLabel.heightAnchor.constraint(equalToConstant: 50),
            operatorLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0),
            operatorLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0),
            
            //MARK: - Result Label Row Label
            lineLabel.heightAnchor.constraint(equalToConstant: 6),
            lineLabel.topAnchor.constraint(equalTo: operatorLabel.bottomAnchor, constant: 0),
            lineLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0),
            lineLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0),
            
            //MARK: - Result Label Row Label
            resultLabel.heightAnchor.constraint(equalToConstant: 90),
            resultLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0),
            resultLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0),

            //MARK: - Stack View Constraints
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            stackView.widthAnchor.constraint(equalToConstant: view.bounds.width/2),
            stackView.heightAnchor.constraint(equalToConstant: 250),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
        
        ])
        
    }
}


extension PlusVC: keyboardTextDelegate {
    func keyboardTapped(numbers: Int) {
        resultLabel.text = "\(numbers)"
        print("oldu\(numbers)")
    }

}

extension CALayer {

    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {

        let border = CALayer()

        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect(x: 0, y: 0, width: self.frame.height, height: thickness)
            break
        case UIRectEdge.bottom:
            border.frame = CGRect(x: 0, y: self.frame.height - thickness, width: UIScreen.main.bounds.width, height: thickness)
            break
        case UIRectEdge.left:
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: self.frame.height)
            break
        case UIRectEdge.right:
            border.frame = CGRect(x: self.frame.width - thickness, y: 0, width: thickness, height: self.frame.height)
            break
        default:
            break
        }

        border.backgroundColor = color.cgColor;

        self.addSublayer(border)
    }

}


