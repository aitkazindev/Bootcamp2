//
//  Bootcamp220_EscapingClosure.swift
//  Bootcamp2
//
//  Created by Ibrahim Aitkazin on 17.10.2024.
//

import SwiftUI

class EscapingViewModel: ObservableObject{
    @Published var text: String = "hello"
    
    func getData(){
        downloadData5 { [weak self] returnedData in
            self?.text =  returnedData.data
        }
    }
    
    func downloadData() -> String{
        return "new data"
    }
    
    func downloadData2(complitionHandler: (_ data: String) -> Void){
        complitionHandler("New data")
    }
    
    func downloadData3(complitionHandler: @escaping (_ data: String) -> Void){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            complitionHandler("New data")
        }
    }
    
    func downloadData4(complitionHandler: @escaping (DownloadResult) -> Void){
        let result = DownloadResult(data: "new data")
        complitionHandler(result)
    }
    
    func downloadData5(complitionHandler: @escaping DownloadCompletion){
        let result = DownloadResult(data: "new data")
        complitionHandler(result)
    }
}

struct DownloadResult {
    let data: String
}

typealias DownloadCompletion = (DownloadResult) -> Void
struct Bootcamp220_EscapingClosure: View {
    @StateObject var vm = EscapingViewModel()
    var body: some View {
        Text(vm.text)
            .font(.largeTitle)
            .onTapGesture {
                vm.getData()
            }
    }
}

#Preview {
    Bootcamp220_EscapingClosure()
}
