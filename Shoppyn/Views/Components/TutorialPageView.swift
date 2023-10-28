//
//  TutorialPageView.swift
//  Shoppyn
//
//  Created by Julien on 28/10/2023.
//

import SwiftUI

struct TutorialPageView: View {
    var tutorial: TutorialPage
    
    var body: some View {
        VStack {
            Image(tutorial.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 250, height: 250)
                .clipShape(Circle())
            
            Text(tutorial.description)
                .multilineTextAlignment(.center)
                .padding([.leading, .trailing], 25)
        }
    }
}

#Preview {
    TutorialPageView(tutorial: TutorialPage(imageName: "shoppingcart",
                                            description: "Create your shopping list as normal but think of your budget target while doing so"))
}
