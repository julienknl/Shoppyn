//
//  OutlineTextField.swift
//  Shoppyn
//
//  Created by Julien on 6/10/2023.
//

import SwiftUI

struct OutlineTextField: View {
    
    @Binding var item: String
    var placeholder: String = ""
    var size: CGSize = CGSize()
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .stroke(Colour.main)
            .foregroundStyle(Colour.main)
            .frame(width: size.width == 0 ? nil : size.width, height: size.height)
            .overlay(
                TextField(placeholder, text: $item)
                    .keyboardType(keyboardType)
                    .frame(maxWidth: .infinity)
                    .padding([.leading, .leading], 8)
            )
    }
}

//#Preview {
//    OutlineTextField()
//}
