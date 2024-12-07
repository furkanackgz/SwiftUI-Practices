//
//  HighOrderFunctionsBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 7.12.2024.
//

import SwiftUI

struct HOFUserModel: Identifiable {
    let id = UUID().uuidString
    let name: String?
    let points: Int
    let isVerified: Bool
}

class HOFBootcampViewModel: ObservableObject {
    
    @Published var users: [HOFUserModel] = []
    @Published var filteredUsers: [HOFUserModel] = []
    @Published var mappedUsers: [String] = []
    
    init() {
        getUsers()
        updateUsers()
    }
    
    func getUsers() {
        let user1 = HOFUserModel(name: "Furkan", points: 1, isVerified: true)
        let user2 = HOFUserModel(name: "Eren", points: 3, isVerified: false)
        let user3 = HOFUserModel(name: "Murathan", points: 6, isVerified: true)
        let user4 = HOFUserModel(name: nil, points: 2, isVerified: false)
        let user5 = HOFUserModel(name: nil, points: 7, isVerified: false)
        users.append(contentsOf: [
            user1, user2, user3, user4, user5
        ])
    }
    
    func updateUsers() {
        // Sort
        /*
        filteredUsers = users.sorted { $0.points > $1.points }
         */
        
        // Filter
        /*
        filteredUsers = users.filter { $0.isVerified }
         */
        
        // Map
        /*
        mappedUsers = users.map { $0.name }
         */
        
        // Compact Map
        mappedUsers = users.compactMap { $0.name }
    }
}

struct HighOrderFunctionsBootcamp: View {
    
    @StateObject var vm = HOFBootcampViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 40) {
                // ForEach for filtered values
                /*
                ForEach(vm.filteredUsers) { user in
                    VStack(alignment: .leading, spacing: 12) {
                        Text(user.name)
                            .font(.headline)
                        HStack {
                            Text("Points: \(user.points)")
                            Spacer()
                            if user.isVerified {
                                Image(systemName: "flame")
                            }
                        }
                    }
                    .foregroundStyle(.white)
                    .padding()
                    .background(Color.blue.clipShape(RoundedRectangle(cornerRadius: 12)))
                    .padding(.horizontal)
                }
                 */
                
                // ForEach for mapped values
                ForEach(vm.mappedUsers, id: \.self) { name in
                    Text(name)
                        .font(.title)
                }
            }
        }
    }
}

#Preview {
    HighOrderFunctionsBootcamp()
}
