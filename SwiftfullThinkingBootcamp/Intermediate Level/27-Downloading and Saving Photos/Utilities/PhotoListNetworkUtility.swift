//
//  PhotoListNetworkUtility.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 29.12.2024.
//

import Combine
import Foundation

class PhotoListNetworkUtility {
    
    static let shared = PhotoListNetworkUtility()
    private init() { }
    
    @Published var photoList: [PhotoModel] = []
    private var cancellables = Set<AnyCancellable>()
    
    func downloadData(from url: URL) {
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [PhotoModel].self, decoder: JSONDecoder())
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error downloading data: \(error)")
                }
            } receiveValue: { [weak self] photoList in
                self?.photoList = photoList
            }
            .store(in: &cancellables)
    }
    
    private func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300
        else {
            throw URLError(.badServerResponse)
        }
        
        return output.data
    }
}
