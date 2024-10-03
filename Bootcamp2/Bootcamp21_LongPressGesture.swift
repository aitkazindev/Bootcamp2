//
//  Bootcamp21_LongPressGesture.swift
//  Bootcamp2
//
//  Created by Ibrahim Aitkazin on 03.10.2024.
//

import SwiftUI

struct Bootcamp21_LongPressGesture: View {
    @State var isComplete: Bool = false
    @State var isSuccess: Bool = false
    var body: some View {
        VStack{
            Rectangle()
                .fill(isSuccess ? Color.green: Color.blue)
                .frame(maxWidth: isComplete ? .infinity: 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity,alignment: .leading)
                .background(Color.gray)
            HStack{
                Text("Click here")
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onLongPressGesture(minimumDuration: 1,maximumDistance: 50){
                        (isPressing) in
                            // start of press -> min duration]
                        if isPressing{
                            withAnimation(.easeInOut(duration: 1.0)) {
                                isComplete = true
                            }
                        }else{
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                                if !isSuccess {
                                    withAnimation(.easeInOut){
                                        isComplete = false
                                    }
                                }
                            }
                        }
                        
                    } perform: {
                        //add the min duration
                        withAnimation(.easeInOut) {
                            isSuccess = true
                        }
                    }
                Text("Reset")
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                    .onTapGesture {
                        isComplete = false
                        isSuccess = false
                    }
            }
        }
        
        
        
        
        
        
        
//        Text(isComplete ? "Completed" : "Not Completed")
//            .padding()
//            .padding(.horizontal)
//            .background(isComplete ? Color.green : Color.gray)
//            .cornerRadius(10)
////            .onTapGesture {
////                isComplete.toggle()
////            }
//            .onLongPressGesture(minimumDuration: 1.0,maximumDistance: 1) {
//                isComplete.toggle()
//            }
    }
}

#Preview {
    Bootcamp21_LongPressGesture()
}
