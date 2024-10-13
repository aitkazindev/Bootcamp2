//
//  Bootcamp213_SortMapFilter.swift
//  Bootcamp2
//
//  Created by Ibrahim Aitkazin on 13.10.2024.
//

import SwiftUI


struct UserModel: Identifiable{
    let id = UUID().uuidString
    let name: String?
    let point: Int
    let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject{
    @Published var array: [UserModel] = []
    @Published var filteredArray: [UserModel] = []
    @Published var mappedArray: [String] = []
    
    init(){
        getUsers()
        updateFilteredArray()
    }
    
    func getUsers() {
        let user1 = UserModel(name: "Nick1", point: 1, isVerified: true)
        let user2 = UserModel(name: nil, point: 2, isVerified: false)
        let user3 = UserModel(name: "Nick3", point: 3, isVerified: true)
        let user4 = UserModel(name: nil, point: 4, isVerified: false)
        let user5 = UserModel(name: "Nick5", point: 5, isVerified: true)
        
        self.array.append(contentsOf: [
            user1,
            user2,
            user3,
            user4,
            user5
        ])
    }
    
    func updateFilteredArray (){
        //sort
        /*
        filteredArray = array.sorted { (user1, user2) -> Bool in
            return user1.point < user2.point
        }
        filteredArray = array.sorted(by: {$0.point < $1.point})
        */
        
        //filter
        /*
        filteredArray = array.filter({ user ->  Bool in
            return user.isVerified
        })
        
        filteredArray = array.filter({!$0.isVerified})
        */
        
        
        // map
        /*
        mappedArray = array.map({ user -> String in
            return user.name
        })
        mappedArray = array.map({$0.name})
        */
        
        //compactMap
//        mappedArray = array.compactMap({ user -> String? in
//            return user.name
//        })
        
        
        let sort = array.sorted { $0.point > $1.point }
        let filter = sort.filter { $0.isVerified }
        
        let map = array.compactMap{$0.name}
        
        mappedArray = map
    }
}
struct Bootcamp213_SortMapFilter: View {
    @StateObject var vm = ArrayModificationViewModel()
    var body: some View {
        ScrollView{
            VStack(spacing: 0){
//                
//                ForEach(vm.filteredArray){ user in
//                    VStack(alignment:.leading){
//                        Text(user.name)
//                        HStack{
//                            Text("Points: \(user.point)")
//                            Spacer()
//                            if user.isVerified {
//                                Image(systemName: "flame.fill")
//                            }
//                        }
//                    }
//                    .padding()
//                    .background(Color.blue)
//                    .cornerRadius(20)
//                    .padding()
//                }
//                
                ForEach(vm.mappedArray, id: \.self){ name in
                    VStack(alignment:.leading){
                        Text(name)
                            .font(.largeTitle)
                        
                    }
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(20)
                    .padding()
                }
            }
        }
    }
}

#Preview {
    Bootcamp213_SortMapFilter()
}
