//
//  PickerBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 8.03.2024.
//

import SwiftUI

struct PickerBootcamp: View {
    
    @State var selection: String = "1"
    
    var body: some View {
        VStack {
            HStack {
                Text("Selection:")
                Text(selection)
            }
            
            Picker("Pick something", selection: $selection) {
                ForEach(1..<5) { number in
                    Text("\(number)").tag("\(number)")
                }
            }
            .pickerStyle(
                MenuPickerStyle()
//                WheelPickerStyle()
//                SegmentedPickerStyle()
            )
        }
    }
}

#Preview {
    PickerBootcamp()
}
