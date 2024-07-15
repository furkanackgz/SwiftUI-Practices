//
//  ShapesBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 7.01.2024.
//

import SwiftUI

struct ShapesBootcamp: View {
    var body: some View {
        //        Circle()
//        Ellipse()
//        Capsule()
//        Rectangle()
        RoundedRectangle(cornerRadius: 20)
//            .fill(.orange)
//            .foregroundStyle(.red)
//            .stroke(.purple)
//            .trim(from: 0.2, to: 1)
            .stroke(.purple,
                    style: .init(lineWidth: 4,
                                 dash: [10]
                                )
            )
            .frame(width: 300, height: 200)
            
    }
}

struct ShapesBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ShapesBootcamp()
    }
}
