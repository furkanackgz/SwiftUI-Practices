//
//  CodableBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 15.12.2024.
//

import SwiftUI

//struct CustomerModel: Decodable, Encodable {
struct CustomerModel: Codable {
    var id: String
    var name: String
    var points: Int
    var isPremium: Bool
    
//    enum CodingKeys: CodingKey {
//        case id
//        case name
//        case points
//        case isPremium
//    }
//    
//    init(id: String,
//         name: String,
//         points: Int,
//         isPremium: Bool) {
//        self.id = id
//        self.name = name
//        self.points = points
//        self.isPremium = isPremium
//    }
//    
//    init(from decoder: any Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        id = try container.decode(String.self, forKey: .id)
//        name = try container.decode(String.self, forKey: .name)
//        points = try container.decode(Int.self, forKey: .points)
//        isPremium = try container.decode(Bool.self, forKey: .isPremium)
//    }
//    
//    func encode(to encoder: any Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(id, forKey: .id)
//        try container.encode(name, forKey: .name)
//        try container.encode(points, forKey: .points)
//        try container.encode(isPremium, forKey: .isPremium)
//    }
}

class CodableBootcampViewModel: ObservableObject {
    @Published var customer: CustomerModel?
    
    init() {
        getData()
    }
    
    private func getData() {
        guard let data = downloadData() else { return }
        do {
            let customer = try JSONDecoder().decode(CustomerModel.self, from: data)
            self.customer = customer
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    private func downloadData() -> Data? {
        let customer = CustomerModel(id: "2024",
                                     name: "Furkan",
                                     points: 10,
                                     isPremium: true)
        let data = try? JSONEncoder().encode(customer)
        return data
    }
}

struct CodableBootcamp: View {
    
    @StateObject var vm = CodableBootcampViewModel()
    
    var body: some View {
        if let customer = vm.customer {
            VStack {
                Text(customer.id)
                Text(customer.name)
                Text("\(customer.points)")
                Text(customer.isPremium.description)
            }
        }
    }
}

#Preview {
    CodableBootcamp()
}
