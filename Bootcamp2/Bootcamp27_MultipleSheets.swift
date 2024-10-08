//
//  MultipleSheets.swift
//  Bootcamp2
//
//  Created by Ibrahim Aitkazin on 09.10.2024.
//

import SwiftUI

struct RandomModel: Identifiable{
    let id = UUID().uuidString
    let title: String
}

// 3 using item
struct MultipleSheets: View {
    
    @State var selectedModel: RandomModel? = nil
    var body: some View {
        VStack(spacing:20){
            Button {
                selectedModel = RandomModel(title: "ONE")
            } label: {
                Text("Button 1")
            }
            
            Button {
                selectedModel = RandomModel(title: "Two")
            } label: {
                Text("Button 2")
            }
            
        }
        .sheet(item: $selectedModel) { model in
            NextScreen(selectedModel: model)
        }
        
        
    }
}

// Multiple sheets
//struct MultipleSheets: View {
//    
//    @State var selectedModel: RandomModel = RandomModel(title: "Starting Title")
//    @State var showSheet1: Bool = false
//    @State var showSheet2: Bool = false
//    
//    
//    var body: some View {
//        VStack(spacing:20){
//            Button {
//                showSheet1.toggle()
//            } label: {
//                Text("Button 1")
//            }
//            .sheet(isPresented: $showSheet1, content: {
//                NextScreen(selectedModel: RandomModel(title: "ONE"))
//            })
//            
//            Button {
//                showSheet2.toggle()
//            } label: {
//                Text("Button 2")
//            }
//            .sheet(isPresented: $showSheet2, content: {
//                NextScreen(selectedModel: RandomModel(title: "ONE"))
//            })
//
//        }
//        
//    }
//}


// Binding
//struct NextScreen: View{
//    @Binding var selectedModel: RandomModel
//    var body: some View{
//        Text(selectedModel.title)
//            .font(.largeTitle)
//    }
//}

struct NextScreen: View{
    let selectedModel: RandomModel
    var body: some View{
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}


#Preview {
    MultipleSheets()
}
