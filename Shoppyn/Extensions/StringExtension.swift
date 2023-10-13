//
//  StringExtension.swift
//  Shoppyn
//
//  Created by Julien on 13/10/2023.
//

import Foundation

extension String {
    func extractNumbers() -> String {
        return self.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
}
