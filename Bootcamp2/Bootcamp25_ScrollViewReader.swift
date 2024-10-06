//
//  Bootcamp25_ScrollViewReader.swift
//  Bootcamp2
//
//  Created by Ibrahim Aitkazin on 06.10.2024.
//

import SwiftUI

struct Bootcamp25_ScrollViewReader: View {
    @State var textFieldString: String = ""
    @State var scrollToIndex: Int = 0
    var body: some View {
        VStack{
            TextField("Enter a # number here", text: $textFieldString)
                .frame(height: 55)
                .border(Color.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            Button("Scroll Now"){
                withAnimation(.spring()) {
                    
                    if let index = Int(textFieldString) {
                        scrollToIndex = index
                    }
                }

            }

            ScrollView{
                ScrollViewReader{ proxy in
                    ForEach(0..<50) { index in
                        Text("This is item #\(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .padding()
                            .id(index)
                    }
                    .onChange(of: scrollToIndex,perform:{ value in
                        withAnimation(.spring()) {
                            proxy.scrollTo(value,anchor: .center)
                        }
                        
                        
                    })
                }
            }
        }
    }

}
        
#Preview {
    Bootcamp25_ScrollViewReader()
}
