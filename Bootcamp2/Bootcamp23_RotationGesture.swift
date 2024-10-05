//
//  Bootcamp23_RotationGesture.swift
//  Bootcamp2
//
//  Created by Ibrahim Aitkazin on 06.10.2024.
//

import SwiftUI

struct Bootcamp23_RotationGesture: View {
    @State var angle: Angle = Angle(degrees: 0)
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .padding(50)
            .background(Color.blue.cornerRadius(10))
            .rotationEffect(angle)
            .gesture(
                RotateGesture()
                    .onChanged{ value in
                        angle = value.rotation
                    }
                    .onEnded{ value in
                        withAnimation(.spring()){
                            angle = Angle(degrees: 0)
                        }
                        
                    }
            )
        
        
    }
}

#Preview {
    Bootcamp23_RotationGesture()
}
