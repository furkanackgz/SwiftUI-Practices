//
//  MultipleSheetsBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 31.10.2024.
//

import SwiftUI

struct MultipleSheetModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

struct MultipleSheetsBootcamp: View {
    
    @State private var multipleSheetModel: MultipleSheetModel?
    
    var body: some View {
        VStack(spacing: 24) {
            Button("Button 1") {
                multipleSheetModel = .init(title: "One")
            }
            
            Button("Button 2") {
                multipleSheetModel = .init(title: "Two")
            }
        }
        .sheet(item: $multipleSheetModel) { model in
            MultipleSheet(multipleSheetModel: model)
        }
    }
}

struct MultipleSheet: View {
    let multipleSheetModel: MultipleSheetModel
    
    var body: some View {
        Text(multipleSheetModel.title)
            .font(.largeTitle)
    }
}

#Preview {
    MultipleSheetsBootcamp()
}
