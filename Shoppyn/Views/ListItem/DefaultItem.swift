//
//  DefaultItem.swift
//  Shoppyn
//
//  Created by Julien on 28/10/2023.
//

import SwiftUI

struct DefaultItem: View {
    var title: String
    
    var body: some View {
        Text(title)
            .foregroundStyle(Colour.darkGray)
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 43)
            .padding([.leading, .trailing])
    }
}

#Preview {
    DefaultItem(title: "Tutorial")
}
