//
//  CheckBox.swift
//  Shoppyn
//
//  Created by Julien on 10/10/2023.
//

import SwiftUI

struct CheckBox: View {
    
    @Binding var isOn: Bool
    
    var body: some View {
        HStack {
            RoundedRectangle(cornerSize: CGSize(width: 5, height: 5))
                .stroke(lineWidth: 1)
                .frame(width: 25, height: 25)
                .foregroundStyle(Colour.main)
                .overlay(content: {
                    Image(systemName: isOn ? "checkmark" : "")
                })
                .onTapGesture {
                    withAnimation {
                        isOn.toggle()
                    }
                }
        }
    }
}

//#Preview {
//    CheckBox()
//}
