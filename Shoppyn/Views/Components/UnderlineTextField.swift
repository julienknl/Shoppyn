//
//  UnderlineTextField.swift
//  Shoppyn
//
//  Created by Julien on 6/10/2023.
//

import SwiftUI

struct UnderlineTextField: View {
    
    @FocusState var isFocused: Bool
    @Binding var budget: String
    
    var body: some View {
        VStack {
            TextField("Budget amount $", text: $budget)
                .focused($isFocused)
                .font(.system(size: 30))
                .multilineTextAlignment(.center)
            Rectangle()
                .frame(height: 2)
                .foregroundStyle(isFocused ? Colour.main : Color.gray.opacity(0.5))
                .padding([.leading, .trailing], 25)
        }
    }
}

//#Preview {
//    UnderlineTextField(isSelected: false, budget: "NaN")
//}
