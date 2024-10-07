//
//  Bootcamp26_GeometryReader.swift
//  Bootcamp2
//
//  Created by Ibrahim Aitkazin on 08.10.2024.
//

import SwiftUI

struct Bootcamp26_GeometryReader: View {
    
//    func getPercentage(geo: GeometryProxy) -> Double{
//        let maxDistance = UIScreen.main.bounds.width / 2
//        let currentX = geo.frame(in: .global).midX
//        return Double(1 - (currentX/maxDistance))
//    }
    func getPercentage(geo: GeometryProxy) -> Double{
        let maxDistance = UIScreen.main.bounds.height / 2
        let currentX = geo.frame(in: .global).midY
        return Double(1 - (currentX/maxDistance))
    }
    var body: some View {
        
        ScrollView(.vertical,showsIndicators: false){
            VStack{
                ForEach(0..<20) { index in
                    GeometryReader{ geometry in
                        RoundedRectangle(cornerRadius: 20)
                            .frame(height: 200)
                            .rotation3DEffect(
                                Angle(degrees: getPercentage(geo: geometry) * 40),
                                                      axis: (x: 1.0, y: 0.0, z: 0.0)
                            )
                    }
                    .frame(width: 300,height: 250)
                    .padding()
                }
            }
        }
        .frame(maxHeight: .infinity)
//        ScrollView(.horizontal,showsIndicators: false){
//            HStack{
//                ForEach(0..<20) { index in
//                    GeometryReader{ geometry in
//                        RoundedRectangle(cornerRadius: 20)
//                            .rotation3DEffect(
//                                Angle(degrees: getPercentage(geo: geometry) * 40),
//                                                      axis: /*@START_MENU_TOKEN@*/(x: 0.0, y: 1.0, z: 0.0)/*@END_MENU_TOKEN@*/
//                            )
//                    }
//                    .frame(width: 300,height: 250)
//                    .padding()
//                }
//            }
//        }
//        .frame(maxHeight: .infinity)
//        GeometryReader{ geometry in
//            HStack(spacing:0){
//                Rectangle()
//                    .fill(Color.red)
//                    .frame(width: geometry.size.width * 0.66)
//                Rectangle()
//                    .fill(Color.blue)
//            }
//            .ignoresSafeArea()
//        }
    }
}

#Preview {
    Bootcamp26_GeometryReader()
}
