//
//  PhotoListNSCacheManager.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 29.12.2024.
//

import Foundation
import SwiftUI

class PhotoListNSCacheManager {
    static let shared = PhotoListNSCacheManager()
    private init() { }
    
    private let photoCache: NSCache<NSString, UIImage> = {
        let photoCache = NSCache<NSString, UIImage>()
        photoCache.countLimit = 200
        photoCache.totalCostLimit = 1024 * 1024 * 200
        return photoCache
    }()
    
    func add(image: UIImage, key: String) {
        photoCache.setObject(image, forKey: key as NSString)
    }
    
    func get(key: String) -> UIImage? {
        photoCache.object(forKey: key as NSString)
    }
}
