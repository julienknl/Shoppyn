//
//  NoDataView.swift
//  Shoppyn
//
//  Created by Julien on 14/10/2023.
//

import SwiftUI

struct NoDataView: View {
    
    var imageName: String
    var title: String
    var subtitle: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 250, height: 250)
                .clipShape(Circle())
            
            Text(title)
                .font(.system(size: 20, weight: .medium))
                .foregroundStyle(.gray)
                .frame(alignment: .center)
                .padding([.leading, .trailing])
            
            Text(subtitle)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding([.leading, .trailing])
        }
    }
}

#Preview {
    NoDataView(imageName: "desertimage",
               title: "NO DATA TO SHOW",
               subtitle: "Tap on add to add a new list of item")
}
