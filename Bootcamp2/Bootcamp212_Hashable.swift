//
//  Bootcamp212_Hashable.swift
//  Bootcamp2
//
//  Created by Ibrahim Aitkazin on 13.10.2024.
//

import SwiftUI

struct MyCustomModel: Hashable{
    let title: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}
//struct MyCustomModel: Identifiable{
//    let id = UUID().uuidString
//    let title: String
//}
struct Bootcamp212_Hashable: View {
    
//    let data: [String] = [
//        "ONE",
//        "TWO",
//        "THREE",
//        "FOUR"
//    ]
    
    let data: [MyCustomModel] = [
        MyCustomModel(title: "ONE"),
        MyCustomModel(title: "TWO"),
        MyCustomModel(title: "THREE"),
        MyCustomModel(title: "FOUR")
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40){
                ForEach(data, id: \.self) { item in
                    Text(item.title)
                        .font(.headline)
                }
//                ForEach(data) { item in
//                    Text(item.hashValue.description)
//                        .font(.headline)
//                }
            }
        }
    }
}

#Preview {
    Bootcamp212_Hashable()
}
