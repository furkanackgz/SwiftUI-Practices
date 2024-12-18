//
//  DownloadJsonWithEscaping.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 18.12.2024.
//

import SwiftUI

struct PostModel: Identifiable, Codable {
    let userId, id: Int
    let title, body: String
}

class DownloadJsonWithEscapingViewModel: ObservableObject {
    
    @Published var posts: [PostModel] = []
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        downloadData(fromURL: url) { data in
            guard let data else { return }
            do {
                let posts = try JSONDecoder().decode([PostModel].self, from: data)
                DispatchQueue.main.async { [weak self] in
                    self?.posts = posts
                }
            } catch let error {
                print("Error decoding data, Error: \(error)")
            }
        }
    }
    
    private func downloadData(fromURL url: URL, completion: @escaping (_ data: Data?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data,
                  error == nil,
                  let response = response as? HTTPURLResponse,
                  response.statusCode >= 200 && response.statusCode < 300 else {
                print("Error downloading data!")
                completion(nil)
                return
            }
            
            completion(data)
        }.resume()
    }
}

struct DownloadJsonWithEscaping: View {
    
    @StateObject var vm = DownloadJsonWithEscapingViewModel()
    
    var body: some View {
        List {
            ForEach(vm.posts) { post in
                VStack(alignment: .leading) {
                    Text(post.title)
                        .font(.headline)
                    Text(post.body)
                        .foregroundStyle(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    DownloadJsonWithEscaping()
}
