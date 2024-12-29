//
//  PhotoModel.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 29.12.2024.
//

import Foundation

struct PhotoModel: Identifiable, Decodable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
    
    enum CodingKeys: CodingKey {
        case albumId
        case id
        case title
        case url
        case thumbnailUrl
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.albumId = try container.decode(Int.self, forKey: .albumId)
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.url = try container.decode(String.self, forKey: .url)
        self.thumbnailUrl = try container.decode(String.self, forKey: .thumbnailUrl)
    }
}
