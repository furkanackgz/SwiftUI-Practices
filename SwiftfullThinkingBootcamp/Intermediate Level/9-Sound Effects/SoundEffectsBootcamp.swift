//
//  SoundEffectsBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 1.11.2024.
//

import SwiftUI
import AVKit

class SoundManager {
    static let shared: SoundManager = SoundManager()
    private init() { }
    
    var player: AVAudioPlayer?
    
    enum SoundOptions: String {
        case badum
        case tada
    }
    
    func play(sound: SoundOptions) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: "mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing audio, error: \(error.localizedDescription)")
        }
    }
}

struct SoundEffectsBootcamp: View {
    var body: some View {
        VStack(spacing: 40) {
            Button("Badum Tsss") {
                SoundManager.shared.play(sound: .badum)
            }
            
            Button("Taadaaa") {
                SoundManager.shared.play(sound: .tada)
            }
        }
    }
}

#Preview {
    SoundEffectsBootcamp()
}
