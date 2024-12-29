//
//  PhotoViewModel.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 29.12.2024.
//

import Combine
import Foundation
import SwiftUI

class PhotoViewModel: ObservableObject {
    
    @Published var image: UIImage?
    private var cancellables = Set<AnyCancellable>()
    private let manager = PhotoListFileManager.shared
    private let urlString: String
    private let key: String
    
    init(urlString: String, key: Int) {
        self.urlString = urlString
        self.key = "\(key)"
        getPhoto()
    }
    
    private func getPhoto() {
        if let image = manager.get(key: key) {
            print("Getting photo from FM")
            self.image = image
        } else {
            print("Downloading photo")
            downloadPhoto()
        }
    }
    
    private func downloadPhoto() {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .compactMap { UIImage(data: $0.data) }
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error downloading photo error: \(error)")
                }
            } receiveValue: { [weak self] image in
                guard let self else { return }
                self.image = image
                manager.add(image: image, key: key)
            }
            .store(in: &cancellables)
    }
    
}
