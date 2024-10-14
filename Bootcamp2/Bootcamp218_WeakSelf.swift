//
//  Bootcamp218_WeakSelf.swift
//  Bootcamp2
//
//  Created by Ibrahim Aitkazin on 14.10.2024.
//

import SwiftUI


struct Bootcamp218_WeakSelf: View {
    
    @AppStorage("count") var count: Int?
    
    init(){
        count = 0
    }
    var body: some View {
        NavigationView{
            NavigationLink("Navigate", destination: WeakSelfSecondScreen()
                .navigationTitle("Screen1")
            )
        }
        .overlay (
            Text("\(count ?? 0)")
                .font(.largeTitle)
                .padding()
                .background(Color.green),
            alignment: .topTrailing
        )
    }
}

struct WeakSelfSecondScreen: View {
    @StateObject var vm = WeakSelfSecondScreenViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Second View")
                    .font(.largeTitle)
                .foregroundStyle(.red)
                
                if let data = vm.data{
                    Text(data)
                }
            }
        }
    }
}

class WeakSelfSecondScreenViewModel: ObservableObject {
    @Published var data: String? = nil
    
    init(){
        print("init NOW")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount + 1,forKey: "count")
        getData()
    }
    
    deinit{
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount - 1,forKey: "count")
        print("deinit NOW")
    }
    func getData() {
        
        DispatchQueue.main.asyncAfter(deadline: .now()+500){ [weak self] in
            self?.data = "New Data "
        }
        
    }
}
#Preview {
    Bootcamp218_WeakSelf()
}
