//
//  LongPressGesture.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 30.08.2024.
//

import SwiftUI

struct LongPressGesture: View {
    
    @State private var onPressing: Bool = false
    @State private var isSuccess: Bool = false
    
    var body: some View {
        Rectangle()
            .fill(isSuccess ? .green : .blue)
            .frame(maxWidth: onPressing ? .infinity : 10)
            .frame(height: 55)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.gray)

        
        HStack {
            Text("Long press to fill")
                .foregroundStyle(.white)
                .padding()
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .onLongPressGesture(minimumDuration: 1, maximumDistance: 50) {
                    withAnimation(.easeInOut) {
                        isSuccess = true
                    }
                } onPressingChanged: { isPressing in
                    if isPressing {
                        withAnimation(.easeInOut(duration: 1)) {
                            onPressing = true
                        }
                    } else {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            if isSuccess == false {
                                withAnimation(.easeInOut) {
                                    onPressing = false
                                }
                            }
                        }
                    }
                }
            
            Text("Reset")
                .foregroundStyle(.white)
                .padding()
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        onPressing = false
                        isSuccess = false
                    }
                }
        }
    }
}

/*
 First Example
 
 @State private var isCompleted: Bool = false
 
 Text(isCompleted ? "Completed" : "Not Completed")
     .padding()
     .padding(.horizontal)
     .background(isCompleted ? .green : .gray)
     .clipShape(RoundedRectangle(cornerRadius: 8))
     .foregroundStyle(.white)
     .font(.headline)
     .onLongPressGesture(minimumDuration: 1) {
         isCompleted.toggle()
     }
 
 */

#Preview {
    LongPressGesture()
}
