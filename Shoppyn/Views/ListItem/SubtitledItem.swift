//
//  SubtitledItem.swift
//  Shoppyn
//
//  Created by Julien on 6/10/2023.
//

import SwiftUI

struct SubtitledItem: View {
    
    var history: HistoryItem
    
    var body: some View {
        VStack {
            Text(history.date ?? "NaN")
                .foregroundStyle(Colour.main)
                .fontWeight(.medium)
                .padding(.leading, 8)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(subtitle(history: history))
                .foregroundStyle(Colour.darkGray)
                .padding(.leading, 8)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(height: 50)
    }
    
    func subtitle(history: HistoryItem) -> String {
        guard let initialBudget = history.initialBudget, let afterBudget = history.afterBudget,  initialBudget > 0.0, afterBudget > 0.0 else {
            print("Error: Failed to render the subtitle as the data might not be present")
            return ""
        }
        
        return history.overBudget ? "You saved $\(afterBudget) on a budget of $\(initialBudget)" : "You loss $\(afterBudget) on a budget of $\(initialBudget)"
    }
}

#Preview {
    SubtitledItem(history: HistoryItem())
}
