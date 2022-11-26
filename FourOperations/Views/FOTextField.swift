//
//  FOTextField.swift
//  FourOperations
//
//  Created by Mutlu Aydin on 11/15/22.
//

import UIKit

class FOTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textFieldConfigure()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func textFieldConfigure() {
        translatesAutoresizingMaskIntoConstraints = false

        textColor = FOColors.textColor
        tintColor = FOColors.textColorH
        backgroundColor = FOColors.cellColor
        layer.cornerRadius = 10
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 10
        returnKeyType = .done
        keyboardType = .asciiCapableNumberPad
        
        autocorrectionType = .no
        setDoneOnKeyboard()
        
        placeholder = "0"
        
        
    }
    
    func setDoneOnKeyboard() {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.dismissKeyboard))
        keyboardToolbar.items = [flexBarButton, doneBarButton]
        inputAccessoryView = keyboardToolbar
    }

    @objc func dismissKeyboard() {
        self.endEditing(true)
    }

}
