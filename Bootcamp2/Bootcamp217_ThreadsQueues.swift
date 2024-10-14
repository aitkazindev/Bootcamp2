//
//  Bootcamp217_ThreadsQueues.swift
//  Bootcamp2
//
//  Created by Ibrahim Aitkazin on 14.10.2024.
//

import SwiftUI

struct Bootcamp217_ThreadsQueues: View {
    
    @StateObject var vm = BackgroundThreadViewModel()
    var body: some View {
        ScrollView{
            LazyVStack(spacing:10){
                Text("LOAD DATA")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .onTapGesture {
                        vm.fetchData()
                    }
                
                ForEach(vm.dataArray, id: \.self) { item in
                        Text(item)
                        .font(.headline)
                        .foregroundStyle(.red)
                }
            }
        }
    }
}

class BackgroundThreadViewModel: ObservableObject{
    @Published var dataArray: [String] = []
    
    func fetchData(){
        DispatchQueue.global(qos: .background).async {
            let newData = self.downloadData()
            
            print("Check 1: \(Thread.isMainThread)")
            
            print("Check 2: \(Thread.current)" )
            DispatchQueue.main.async{
                self.dataArray = newData
                print("Check 1: \(Thread.isMainThread)")
                
                print("Check 2: \(Thread.current)" )
            }
        }
        
    }
    
    private func downloadData() -> [String]{
        var data: [String] = []
        
        for i in 0..<100 {
            data.append("\(i)")
            print(i)
        }
        return data
    }
}

#Preview {
    Bootcamp217_ThreadsQueues()
}
