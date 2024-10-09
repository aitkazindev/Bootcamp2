//
//  Bootcamp28.swift
//  Bootcamp2
//
//  Created by Ibrahim Aitkazin on 10.10.2024.
//

import SwiftUI

struct Bootcamp28: View {
    @State var rating: Int = 2
    var body: some View {
        ZStack{
            starsView
                .overlay(overlayView.mask(starsView))
        }
    }
    
    private var overlayView: some View{
        GeometryReader{ geometry in
            ZStack(alignment: .leading){
                Rectangle()
                    //.foregroundColor(.yellow)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]),startPoint: .leading,endPoint: .trailing))
                    .frame(width: CGFloat(rating) / 5*geometry.size.width)
            }
        }
        .allowsHitTesting(false)
    }
    private var starsView: some View{
        HStack{
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundColor(Color.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut){
                            rating = index
                        }
                    }
            }
        }
    }
}

#Preview {
    Bootcamp28()
}
