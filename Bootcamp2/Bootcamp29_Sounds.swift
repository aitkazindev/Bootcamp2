//
//  Bootcamp29_Sounds.swift
//  Bootcamp2
//
//  Created by Ibrahim Aitkazin on 11.10.2024.
//

import SwiftUI
import AVKit

class SoundManager{
    
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case tadam
        case badam
    }
    func playSound(sound: SoundOption){
        
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension:".mp3") else { return }
        do {
            player = try AVAudioPlayer(contentsOf:url)
            
            player?.play()
                                    
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
            
                                    
    }
    
}

struct Bootcamp29_Sounds: View {
    
    
    
    var body: some View {
        VStack(spacing: 40){
            Button {
                SoundManager.instance.playSound(sound: .tadam)
            } label: {
                Text("Play sound 1")
            }
            
            Button {
                SoundManager.instance.playSound(sound: .badam)
            } label: {
                Text("Play sound 2")
            }

        }
    }
}

#Preview {
    Bootcamp29_Sounds()
}
