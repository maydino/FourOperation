//
//  UserDefaultsKeys.swift
//  FourOperations
//
//  Created by Mutlu Aydin on 11/15/22.
//  Copyright © 2022 Mutlu Aydin. All rights reserved.
//


import Foundation


struct UserDefaultKey {
    
    static let defaults = UserDefaults.standard

    static let reminderOnOff = "reminderOn" //Bool
    static let dailyReminderTime = "dailyReminderTime"
    static let notification = "notification"
    static let changeModeOn = "changeModeOn"
    
}
