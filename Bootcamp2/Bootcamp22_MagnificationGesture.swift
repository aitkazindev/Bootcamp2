//
//  MagnificationGesture.swift
//  Bootcamp2
//
//  Created by Ibrahim Aitkazin on 05.10.2024.
//

import SwiftUI

struct MagnificationGesture: View {
    @State var currentAmount: CGFloat = 0
    @State var lastAmount: CGFloat = 0
    var body: some View {
        VStack(spacing: 10){
            HStack{
                Circle()
                    .frame(width: 35, height: 35)
                Text("Swiftful thinking")
                Spacer()
                Image(systemName: "ellipsis")
                
            }
            .padding(.horizontal)
            
            Rectangle()
                .frame(height: 300)
                .scaleEffect(1 + currentAmount)
                .gesture(
                    MagnifyGesture()
                        .onChanged{ value in
                            currentAmount = value.magnification - 1
                            
                        }
                        .onEnded{value in
                            withAnimation(.spring()){
                                currentAmount = 0
                            }
                        }
                )
            HStack{
                Image(systemName: "heart.fill")
                Image(systemName: "text.bubble.fill")
                Spacer()
            }
            .padding(.horizontal)
            .font(.headline)
            
            Text("This is the caption for my photo.")
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(.horizontal)
            
        }
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .font(.title)
//            .padding(40)
//            .background(Color.red.cornerRadius(10))
//            .scaleEffect(1 + currentAmount + lastAmount)
//            .gesture(
//                MagnifyGesture()
//                    .onChanged{ value in
//                        currentAmount = value.magnification - 1
//                    }
//                    .onEnded{ value in
//                        lastAmount +=  currentAmount
//                        currentAmount = 0
//                    }
//            )
    }
}

#Preview {
    MagnificationGesture()
}
