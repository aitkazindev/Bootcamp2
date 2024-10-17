//
//  Bootcomp219_TypeAlies.swift
//  Bootcamp2
//
//  Created by Ibrahim Aitkazin on 17.10.2024.
//

import SwiftUI

struct MovieModel{
    let title: String
    let director: String
    let count: Int
}

typealias TVModel = MovieModel

struct Bootcomp219_TypeAlies: View {
    @State var item: MovieModel = MovieModel(title: "1+1", director: "Joe", count: 5)
    var body: some View {
        VStack{
            Text(item.title)
            Text(item.director)
            Text("\(item.count)")
        }
    }
}

#Preview {
    Bootcomp219_TypeAlies()
}
