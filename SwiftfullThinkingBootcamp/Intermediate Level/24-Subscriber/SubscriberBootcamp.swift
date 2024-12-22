//
//  SubscriberBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 22.12.2024.
//

import Combine
import SwiftUI

class SubscriberViewModel: ObservableObject {
    var cancellable = Set<AnyCancellable>()
    var timer: AnyCancellable?
    @Published var count: Int = 0
    @Published var textFieldText: String = ""
    @Published var isTextValid: Bool = false
    @Published var isDisabled: Bool = false
    
    init() {
        createPublisherForCount()
        createPublisherForIsTextValid()
        createPublisherForIsDisabled()
    }
    
    private func createPublisherForCount() {
        timer = Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self else { return }
                if count == 10 {
                    timer?.cancel()
                } else {
                    count += 1
                }
            }
    }
    
    private func createPublisherForIsTextValid() {
        $textFieldText
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .map { text in
                if text.count > 3 {
                    return true
                }
                return false
            }
            .sink { [weak self] value in
                self?.isTextValid = value
            }
            .store(in: &cancellable)
    }
    
    private func createPublisherForIsDisabled() {
        $isTextValid
            .combineLatest($count)
            .sink { [weak self] isValid, count in
                if isValid && count >= 10 {
                    self?.isDisabled = false
                } else {
                    self?.isDisabled = true
                }
            }
            .store(in: &cancellable)
    }
    
}

struct SubscriberBootcamp: View {
    @StateObject var vm = SubscriberViewModel()
    
    var body: some View {
        VStack {
            Text("\(vm.count)")
                .font(.largeTitle)
            
            TextField("Type something here...", text: $vm.textFieldText)
                .padding(.leading)
                .frame(height: 55)
                .background(.gray.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal)
                .overlay(alignment: .trailing) {
                    Image(systemName: vm.textFieldText.count == 0 ? "" :
                            vm.isTextValid ? "checkmark" : "xmark")
                        .padding(.trailing, 28)
                        .imageScale(.large)
                        .foregroundStyle(vm.isTextValid ? Color.green : Color.red)
                }
            
            Button {
                
            } label: {
                Text("Send")
                    .tint(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(
                        Color.blue
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            .opacity(vm.isDisabled ? 0.3 : 1)
                    )
                    .padding(.horizontal)
            }
            .disabled(vm.isDisabled)
        }
    }
}

#Preview {
    SubscriberBootcamp()
}
