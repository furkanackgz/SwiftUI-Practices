//
//  NoListDataView.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 3.08.2024.
//

import SwiftUI

struct NoListDataView: View {
    
    @State private var animate: Bool = false
    
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            titleText
            descriptionText
            addSomethingButton
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(30)
        .onAppear(perform: startAnimation)
    }
}

// MARK: Components
private extension NoListDataView {
    var titleText: some View {
        Text("There are no items!")
            .font(.title)
            .fontWeight(.semibold)
    }
    
    var descriptionText: some View {
        Text("Are you a productive person? I think you should click the add button and add a bunch of items to your todo list!")
            .padding(.bottom, 20)
    }
    
    var addSomethingButton: some View {
        NavigationLink {
            ToDoAddView()
        } label: {
            Text("Add Something 🥳")
                .font(.headline)
                .foregroundStyle(.white)
                .padding()
                .padding(.horizontal, animate ? 30 : 10)
                .background(
                    Color(animate ? Color.red : Color.purple)
                    .clipShape(
                        RoundedRectangle(cornerRadius: animate ? 12 : 8)
                    )
                )
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
                .shadow(
                    color: Color(animate ? Color.red.opacity(0.7) : Color.purple.opacity(0.7)),
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 10 : 30
                )
        }
    }
}

// MARK: Methods
private extension NoListDataView {
    func startAnimation() {
        guard animate == false else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation.easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationStack {
        NoListDataView()
            .navigationTitle("Title")
    }
}
