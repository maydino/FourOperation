//
//  Date+Ext.swift
//  FourOperations
//
//  Created by Mutlu Aydin on 11/15/22.
//  Copyright © 2022 Mutlu Aydin. All rights reserved.
//


import Foundation


extension Date {
   func getFormattedDate(format: String) -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = format
        return dateFormat.string(from: self)
    }
}
