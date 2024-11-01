//
//  HapticsBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 1.11.2024.
//

import SwiftUI

struct HapticsManager {
    static let shared: HapticsManager = HapticsManager()
    private init() { }
    
    enum HapticTypes {
        case error
        case warning
        case success
        case soft
        case light
        case medium
        case rigid
        case heavy
    }
    
    func vibrate(with type: HapticTypes) {
        switch type {
        case .error:
            notification(type: .error)
        case .warning:
            notification(type: .warning)
        case .success:
            notification(type: .success)
        case .soft:
            impact(style: .soft)
        case .light:
            impact(style: .light)
        case .medium:
            impact(style: .medium)
        case .rigid:
            impact(style: .rigid)
        case .heavy:
            impact(style: .heavy)
        }
    }
    
    private func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    private func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

struct HapticsBootcamp: View {
    var body: some View {
        VStack(spacing: 40) {
            Button("error") { HapticsManager.shared.vibrate(with: .error) }
            Button("warning") { HapticsManager.shared.vibrate(with: .warning) }
            Button("success") { HapticsManager.shared.vibrate(with: .success) }
            Divider()
            Button("soft") { HapticsManager.shared.vibrate(with: .soft) }
            Button("light") { HapticsManager.shared.vibrate(with: .light) }
            Button("medium") { HapticsManager.shared.vibrate(with: .medium) }
            Button("rigid") { HapticsManager.shared.vibrate(with: .rigid) }
            Button("heavy") { HapticsManager.shared.vibrate(with: .heavy) }
        }
    }
}

#Preview {
    HapticsBootcamp()
}
