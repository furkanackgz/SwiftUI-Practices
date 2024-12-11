//
//  TypealiasBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 11.12.2024.
//

import SwiftUI

struct MovieModel {
    let name: String
    let director: String
    let count: String
}

typealias TVShowModel = MovieModel

struct TypealiasBootcamp: View {
    
    @State var tvShowModel: TVShowModel = .init(name: "Movie", director: "Furkan", count: "1")
    
    var body: some View {
        VStack {
            Text(tvShowModel.name)
            Text(tvShowModel.director)
            Text(tvShowModel.count)
        }
    }
}

#Preview {
    TypealiasBootcamp()
}
