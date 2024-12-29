//
//  PhotoListViewModel.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 29.12.2024.
//

import Combine
import Foundation

class PhotoListViewModel: ObservableObject {
    
    @Published var photoList: [PhotoModel] = []
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        subscribeToNetworkUtility()
        getPhotoList()
    }
    
    private func subscribeToNetworkUtility() {
        PhotoListNetworkUtility.shared.$photoList
            .sink { [weak self] photoList in
                self?.photoList = photoList
            }
            .store(in: &cancellables)
    }
    
    private func getPhotoList() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else { return }
        PhotoListNetworkUtility.shared.downloadData(from: url)
    }
}
