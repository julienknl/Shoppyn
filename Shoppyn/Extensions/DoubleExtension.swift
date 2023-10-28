//
//  DoubleExtension.swift
//  Shoppyn
//
//  Created by Julien on 10/10/2023.
//

import Foundation

extension Double {
    
    func round(to decimalPlaces: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = decimalPlaces
        numberFormatter.maximumFractionDigits = decimalPlaces
        
        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
    
    var isNegative: Bool {
        return self < 0
    }
}
