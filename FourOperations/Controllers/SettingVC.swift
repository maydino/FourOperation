//
//  SettingVC.swift
//  FourOperations
//
//  Created by Mutlu Aydin on 11/10/22.
//

import UIKit
import UserNotifications

final class SettingVC: UIViewController {

    // Notification
    private let notificationManager = NotificationManager()
    
    //MARK: - UI Properties
    // Reminder on and off row, First Row
    private let darkModeOnLabel = FOLabel(textAlignment: .left, fontSize: 20)
    private let darkModeOnSwitch = UISwitch()
    
    // Reminder on and off row, Second Row
    private let dailyReminderOnOffLabel = FOLabel(textAlignment: .left, fontSize: 20)
    private let dailyReminderSwitch = UISwitch()
    
    // Time Picker Info, Third Row
    private let timePickTextLabel = FOLabel(textAlignment: .left, fontSize: 20)
    private let timePickTextField = FOTextField()
    // Time Picker, Bottom Row
    private let timePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .time
        datePicker.preferredDatePickerStyle = .wheels
        return datePicker
    }()
    
    //MARK: - Unwrap User Default Properties
    private let darkModeOnSwitchDefault: Bool? = UserDefaultKey.defaults.object(forKey: UserDefaultKey.changeModeOn) as? Bool
    private let reminderOnOffBool: Bool? = UserDefaultKey.defaults.object(forKey: UserDefaultKey.reminderOnOff) as? Bool
    private let savedDate: Date? = UserDefaultKey.defaults.object(forKey: UserDefaultKey.dailyReminderTime) as? Date
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationManager.requestNotificationAuthorization()
        
        // Backgroundcolor
        view.backgroundColor = FOColors.backgroundColor
        
        // First Row
        darkModeOnLabelConfiguration()
        darkModeOnSwitchConfiguration()
        
        // Second Row
        dailyReminderOnOffLabelConfiguration()
        dailyReminderSwitchConfiguration()
        
        // Third Row
        TimePickTextLabelConfiguration()
        timePickTextFieldConfiguration()
        
        // Bottom Row
        timePickerConfiguration()
    }
    
    //MARK: - First Row UI, FOR DARK MODE
    
    func darkModeOnLabelConfiguration() {
        
        darkModeOnLabel.text = "Change Theme"
        view.addSubview(darkModeOnLabel)
        
        NSLayoutConstraint.activate([
            darkModeOnLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            darkModeOnLabel.heightAnchor.constraint(equalToConstant: 50),
            darkModeOnLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            darkModeOnLabel.widthAnchor.constraint(equalToConstant: 240)
        ])
    }
    
    func darkModeOnSwitchConfiguration() {
        if darkModeOnSwitchDefault == true {
            darkModeOnSwitch.isOn = true
        }
        
        darkModeOnSwitch.addTarget(self, action: #selector(darkModeSwitchValueDidChange(_:)), for: .allTouchEvents)
        darkModeOnSwitch.frame = CGRect(x: view.bounds.width-65, y: 100, width: 100, height: 50)
        view.addSubview(darkModeOnSwitch)
        
    }
    
    @objc func darkModeSwitchValueDidChange(_ sender: UISwitch) {
        
        if #available(iOS 13.0, *) {
            let appDelegate = UIApplication.shared.windows.first
            if sender.isOn {
                UserDefaultKey.defaults.set(true, forKey: UserDefaultKey.changeModeOn)
                appDelegate?.overrideUserInterfaceStyle = .dark
                return
            } else {
                UserDefaultKey.defaults.set(false, forKey: UserDefaultKey.changeModeOn)
            }
            appDelegate?.overrideUserInterfaceStyle = .light
            return
        }
    }
    
    //MARK: - Second Row, FOR DAILY REMINDER
    func dailyReminderOnOffLabelConfiguration() {
        dailyReminderOnOffLabel.text = "Turn on daily reminders"
        view.addSubview(dailyReminderOnOffLabel)
        
        NSLayoutConstraint.activate([
            dailyReminderOnOffLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            dailyReminderOnOffLabel.heightAnchor.constraint(equalToConstant: 50),
            dailyReminderOnOffLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            dailyReminderOnOffLabel.widthAnchor.constraint(equalToConstant: 240)
        ])
    }
    
    func dailyReminderSwitchConfiguration() {
        if reminderOnOffBool == true { dailyReminderSwitch.isOn = true }
        
        dailyReminderSwitch.addTarget(self, action: #selector(dailyReminderSwitchChanged(_:)), for: .allTouchEvents)
        dailyReminderSwitch.frame = CGRect(x: view.bounds.width-65, y: 150, width: 100, height: 50)
        view.addSubview(dailyReminderSwitch)
    }
    
    @objc func dailyReminderSwitchChanged(_ sender: UISwitch) {
        
        if dailyReminderSwitch.isOn == false {
            UserDefaultKey.defaults.set(false, forKey: UserDefaultKey.reminderOnOff)
            notificationManager.removeNotification(idString: "reminder")
            print("notification turned off")
            return
        }
        
        // Check notification status and return
        notificationManager.userNotificationCenter.getNotificationSettings(completionHandler: { permission in
            switch permission.authorizationStatus  {
            case .authorized:
                print("User granted permission for notification")
                
                DispatchQueue.main.async { [self] in
                    
                    if self.timePickTextField.text != "" {
                        // Set Daily reminder on
                        dailyReminderSwitch.isOn = true
                        UserDefaultKey.defaults.set(true, forKey: UserDefaultKey.reminderOnOff)
                        
                        // Save the time and set the notification
                        notificationManager.sendNotification(hour: datePickerComponent().hour!, minute: datePickerComponent().minute!, idString: "reminder")
                        
                    } else {
                        //Show an alert if the time hasn't been chosen.
                        let noSavedDateAlert = UIAlertController(title: "Alert", message: "Please Pick a time first", preferredStyle: .alert)
                        let alertAction = UIAlertAction(title: "Ok", style: .cancel)
                        noSavedDateAlert.addAction(alertAction)
                        UserDefaultKey.defaults.set(nil, forKey: UserDefaultKey.reminderOnOff)
                        present(noSavedDateAlert, animated: true)
                        dailyReminderSwitch.isOn = false
                    }
                }
            // If user deny notifications
            case .denied:
                print("User denied notification permission")
                DispatchQueue.main.async {
                    self.dailyReminderSwitch.isOn = false
                }
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
                
            case .notDetermined:
                print("Notification permission haven't been asked yet")
                self.dailyReminderSwitch.isOn = false
            case .provisional:
                // @available(iOS 12.0, *)
                print("The application is authorized to post non-interruptive user notifications.")
            case .ephemeral:
                // @available(iOS 14.0, *)
                print("The application is temporarily authorized to post notifications. Only available to app clips.")
            @unknown default:
                print("Unknown Status")
            }
        })
    }
    
    //MARK: - Third Row, SET THE TIME
    func TimePickTextLabelConfiguration() {
        
        timePickTextLabel.text = "Set reminder time"
        view.addSubview(timePickTextLabel)
        
        NSLayoutConstraint.activate([
            timePickTextLabel.topAnchor.constraint(equalTo: dailyReminderOnOffLabel.bottomAnchor, constant: 10),
            timePickTextLabel.heightAnchor.constraint(equalToConstant: 40),
            timePickTextLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            timePickTextLabel.widthAnchor.constraint(equalToConstant: 240)
        ])
    }
    
    func timePickTextFieldConfiguration() {
        timePickTextField.placeholder = "Tap it"
        
        if let date = savedDate {
            timePickTextField.text = date.getFormattedDate(format: "hh:mm a")
        }
        
        timePickTextField.textAlignment = .center
        timePickTextField.layer.borderWidth = 3.0
        timePickTextField.layer.borderColor = UIColor.systemGray.cgColor
        view.addSubview(timePickTextField)
        
        NSLayoutConstraint.activate([
            timePickTextField.topAnchor.constraint(equalTo: timePickTextLabel.topAnchor, constant: 0),
            timePickTextField.heightAnchor.constraint(equalToConstant: 40),
            timePickTextField.leadingAnchor.constraint(equalTo: timePickTextLabel.trailingAnchor, constant: 10),
            timePickTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
    
    //MARK: - Bottom Row, TIME PICKER
    // Configuration
    func timePickerConfiguration() {
        // Toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        // Toolbar Button
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(timePickerDonePressed))
        let dismissButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: #selector(cancelPressed))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil);
        toolbar.setItems([doneButton, flexibleSpace, dismissButton], animated: true)
        // Assign toolbar
        timePickTextField.inputAccessoryView = toolbar
        
        // Assign date picker to the textField
        timePickTextField.inputView = timePicker
    }
    
    // Action
    @objc func timePickerDonePressed() {
        
        timePickTextField.text = timePicker.date.getFormattedDate(format: "hh:mm a")
        UserDefaultKey.defaults.set(timePicker.date, forKey: UserDefaultKey.dailyReminderTime)
        
        // Set the notification
        if dailyReminderSwitch.isOn {
            notificationManager.sendNotification(hour: datePickerComponent().hour!, minute: datePickerComponent().minute!, idString: "reminder")
            print(2)
        }
        
        self.view.endEditing(true)
    }
    
    @objc func cancelPressed() {
        self.view.endEditing(true)
    }
    
    
    
    func datePickerComponent() -> DateComponents {
        let date = timePicker.date
        let components = Calendar.current.dateComponents([.hour, .minute], from: date)
        return components
    }
}
