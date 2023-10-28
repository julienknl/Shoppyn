//
//  TutorialScene.swift
//  Shoppyn
//
//  Created by Julien on 28/10/2023.
//

import SwiftUI

struct TutorialScene: View {
    
    @State private var currentPage = 0
    
    private let pages = [
        TutorialPage(imageName: "shoppingcart",
                     description: "Create your shopping list as you normally would, but keep your budget target in mind while doing so"),
        TutorialPage(imageName: "budgetthinker",
                     description: "Establish a reasonable budget to help you maintain control over your spending while shopping"),
        TutorialPage(imageName: "shoppinglist",
                     description: "Don't forget to include the price for each item you add to your cart, as it will be deducted automatically from your budget")
    ]
    
    var body: some View {
        NavigationStack {
            TabView(selection: $currentPage,
                    content:  {
                ForEach(0..<pages.count, id: \.self) { index in
                    TutorialPageView(tutorial: pages[index])
                        .tag(index)
                }
            })
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        
                    }, label: {
                        Text("Done")
                            .foregroundStyle(Colour.darkGray)
                    })
                }
            }
        }
        
    }
}

#Preview {
    TutorialScene()
}
