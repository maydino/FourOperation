//
//  Date+Ext.swift
//  FourOperations
//
//  Created by Mutlu Aydin on 11/15/22.
//

import Foundation


extension Date {
   func getFormattedDate(format: String) -> String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = format
        return dateFormat.string(from: self)
    }
}
