//
//  DynamicDotsText.swift
//  Shoppyn
//
//  Created by Julien on 13/10/2023.
//

import SwiftUI

struct DynamicDotsText: View {
    
    var firstText: String = "Budget"
    var secondText: String = "$70"
    var fontSize: CGFloat = 14
    var textColor: Color = Colour.darkGray
    
    var body: some View {
        HStack {
            Text(firstText)
                .lineLimit(1)
                .foregroundStyle(textColor)
            Text(String(repeating: ".", 
                        count: calculateDotsCount(for: firstText, secondText: secondText)))
                .lineLimit(1)
                .foregroundStyle(textColor)
            Text(secondText)
                .foregroundStyle(textColor)
        }
    }
    
    private func calculateDotsCount(for text: String, secondText: String) -> Int {
        let totalWidth = UIScreen.main.bounds.width
        let textWidth = text.size(withAttributes: [.font: UIFont.systemFont(ofSize: fontSize)]).width
        let secondTextWidth = secondText.size(withAttributes: [.font: UIFont.systemFont(ofSize: fontSize)]).width
        let availableWidth = totalWidth - (textWidth + secondTextWidth)
        let dotWidth = ".".size(withAttributes: [.font: UIFont.systemFont(ofSize: fontSize)]).width
        let dotsCount = Int(availableWidth / dotWidth)
        
        return max(0, dotsCount)
    }
}

#Preview {
    DynamicDotsText()
}
