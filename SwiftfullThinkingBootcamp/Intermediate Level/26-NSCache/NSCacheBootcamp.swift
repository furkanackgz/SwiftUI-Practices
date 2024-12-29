//
//  NSCacheBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 29.12.2024.
//

import SwiftUI

class NSCacheManager {
    static let shared = NSCacheManager()
    private init() { }
    
    private let imageCache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100
        return cache
    }()
    
    func save(image: UIImage, imageName: String) {
        imageCache.setObject(image, forKey: imageName as NSString)
    }
    
    func get(imageName: String) -> UIImage? {
        imageCache.object(forKey: imageName as NSString)
    }
    
    func delete(imageName: String) {
        imageCache.removeObject(forKey: imageName as NSString)
    }
}

class NSCacheViewModel: ObservableObject {
    
    @Published var assetsImage: UIImage? = nil
    @Published var cachedImage: UIImage? = nil
    private let cacheManager = NSCacheManager.shared
    private let imageName = "tesla"
    
    init() {
        getImageFromAssetFolder()
    }
    
    private func getImageFromAssetFolder() {
        assetsImage = UIImage(named: imageName)
    }
    
    
    func getImageFromNSCache() {
        cachedImage = cacheManager.get(imageName: imageName)
    }
    
    func saveImageToNSCache() {
        guard let assetsImage else { return }
        cacheManager.save(image: assetsImage, imageName: imageName)
    }
    
    func deleteImageFromNSCache() {
        cacheManager.delete(imageName: imageName)
    }
}

struct NSCacheBootcamp: View {
    
    @StateObject private var vm = NSCacheViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let assetsImage = vm.assetsImage {
                    Image(uiImage: assetsImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                
                VStack {
                    Button {
                        vm.saveImageToNSCache()
                    } label: {
                        Text("Save to NSCache")
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .background(
                                Color.blue
                                    .clipShape(
                                        RoundedRectangle(cornerRadius: 8)
                                    )
                            )
                            .shadow(radius: 8)
                    }

                    Button {
                        vm.deleteImageFromNSCache()
                    } label: {
                        Text("Delete from NSCache")
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .background(
                                Color.red
                                    .clipShape(
                                        RoundedRectangle(cornerRadius: 8)
                                    )
                            )
                            .shadow(radius: 8)
                    }
                    
                    Button {
                        vm.getImageFromNSCache()
                    } label: {
                        Text("Get from NSCache")
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .background(
                                Color.green
                                    .clipShape(
                                        RoundedRectangle(cornerRadius: 8)
                                    )
                            )
                            .shadow(radius: 8)
                    }
                }
                .tint(.white)
                
                if let assetsImage = vm.cachedImage {
                    Image(uiImage: assetsImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
            .navigationTitle("NSCache Bootcamp")
        }
    }
}

#Preview {
    NSCacheBootcamp()
}
