//
//  UIApplicationExtension.swift
//  Shoppyn
//
//  Created by Julien on 13/10/2023.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
