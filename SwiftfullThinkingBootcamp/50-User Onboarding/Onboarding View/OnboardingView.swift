//
//  OnboardingView.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 25.03.2024.
//

import SwiftUI

struct OnboardingView: View {
    
    // Onboarding States
    /*
     0 -> Welcome Screen
     1 -> Add Name Screen
     2 -> Add Age Screen
     3 -> Add Gender Screen
     */
    @State var currentOnboardingState: Int = 0
    
    // User info
    @State var name: String = ""
    @State var age: Double = 18
    @State var gender: String = "Male"
    
    // AppStorage
    @AppStorage("name") var storedName: String?
    @AppStorage("age") var storedAge: Int?
    @AppStorage("gender") var storedGender: String?
    @AppStorage("signed_in") var storedSignedIn: Bool = false
    
    private let transition: AnyTransition = .asymmetric(
        insertion: .move(edge: .trailing),
        removal: .move(edge: .leading)
    )
    
    var body: some View {
        ZStack {
            // content
            switch currentOnboardingState {
            case 0:
                welcomeSection
                    .transition(transition)
            case 1:
                addNameSection
                    .transition(transition)
            case 2:
                addAgeSection
                    .transition(transition)
            case 3:
                addGenderSection
                    .transition(transition)
            default:
                Text("")
            }
            
            // buttons
            VStack {
                Spacer()
                signUpButton
            }
            .padding()
        }
    }
}

// Mark: COMPONENTS

private extension OnboardingView {
    var signUpButton: some View {
        Text(getButtonTitleForNextButtonPress())
            .foregroundStyle(.blue)
            .font(.headline)
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(
                Color.white
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            )
            .onTapGesture {
                handleNextButtonPress()
            }
    }
    
    var welcomeSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            Text("Find your match")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .overlay(alignment: .bottom) {
                    Capsule()
                        .frame(height: 3)
                }
            
            Text("This is the #1 app for finding your match online!")
                .fontWeight(.medium)
                .padding(.horizontal)
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
        .foregroundStyle(.white)
        .padding(30)
    }
    
    var addNameSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What's your name?")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            
            TextField("Your name here...", text: $name)
            .padding()
            .background(
                Color.white
                    .clipShape(
                        RoundedRectangle(cornerRadius: 12)
                    )
            )
            Spacer()
            Spacer()
        }
        .padding(30)
    }
    
    var addAgeSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What is your age?")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text(String(format: "%.0f", age))
                .font(.title)
                .fontWeight(.semibold)
            
            Slider(value: $age, in: 18...100) {
                Text("\(age)")
            } minimumValueLabel: {
                Text("18")
            } maximumValueLabel: {
                Text("100")
            }
            .font(.headline)
            .fontWeight(.medium)
            .tint(.white)
            .padding(.horizontal)
            Spacer()
            Spacer()
        }
        .foregroundStyle(.white)
        .padding(30)
    }
    
    var addGenderSection: some View {
        VStack(spacing: 30) {
            Spacer()
            Text("What is your gender?")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Picker("your gender here..", selection: $gender) {
                Text("Male").tag("Male")
                Text("Female").tag("Female")
                Text("Non-binary").tag("Non-binary")
            }
            .foregroundStyle(.white)
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(
                Color.white
                    .clipShape(
                        RoundedRectangle(cornerRadius: 12)
                    )
            )
            
            Spacer()
            Spacer()
        }
        .padding(30)
        .foregroundStyle(.white)
    }
}

// MARK: FUNCTIONS

private extension OnboardingView {
    func getButtonTitleForNextButtonPress() -> String {
        currentOnboardingState == 0 ? "SIGN UP" : currentOnboardingState == 3 ? "Finish" : "Next"
    }
    
    func handleNextButtonPress() {
        if currentOnboardingState == 3 {
            saveUserInfoToAppStorage()
        } else {
            withAnimation(.smooth) {
                currentOnboardingState += 1
            }
        }
    }
    
    func saveUserInfoToAppStorage() {
        storedName = name
        storedAge = Int(age)
        storedGender = gender
        storedSignedIn = true
    }
}

#Preview {
    OnboardingView()
        .background(Color.blue)
}
