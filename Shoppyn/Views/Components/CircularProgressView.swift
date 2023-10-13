//
//  CircularProgressView.swift
//  Shoppyn
//
//  Created by Julien on 11/10/2023.
//

import SwiftUI

struct CircularProgressView: View {
    
    @Binding var progress: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 30)
                .opacity(0.1)
                .foregroundStyle(Colour.main)
            
            Circle()
                .trim(from: 0, to: CGFloat(progress))
                .stroke(style: StrokeStyle(lineWidth: 30, lineCap: .round, lineJoin: .round))
                .foregroundStyle(Colour.main)
                .rotationEffect(.degrees(10))
        }
        .padding([.leading, .trailing])
    }
}

//#Preview {
//    CircularProgressView()
//}
