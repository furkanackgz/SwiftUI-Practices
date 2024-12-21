//
//  DownloadJSONWithCombine.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 21.12.2024.
//

import Combine
import SwiftUI

class DownloadJsonWithCombineViewModel: ObservableObject {
    
    @Published var posts: [PostModel] = []
    @State private var cancellables = Set<AnyCancellable>()
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        downloadPosts(with: url)
    }
    
    private func downloadPosts(with url: URL) {
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .decode(type: [PostModel].self, decoder: JSONDecoder())
            .sink { completion in
                switch completion {
                case .finished:
                    print("Finished successfully")
                case .failure(let error):
                    print("Error: \(error)")
                }
            } receiveValue: { posts in
                self.posts = posts
            }
            .store(in: &cancellables)
    }
}

struct DownloadJSONWithCombine: View {
    
    @StateObject var vm = DownloadJsonWithCombineViewModel()
    
    var body: some View {
        List {
            ForEach(vm.posts) { post in
                LazyVStack(alignment: .leading) {
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
    DownloadJSONWithCombine()
}
