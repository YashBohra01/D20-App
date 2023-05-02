//
//  AudioManager.swift
//  D20
//
//  Created by Yash Bohra on 30/03/23.
//

import Foundation
import AVKit

final class AudioManager {
    static let shared=AudioManager()
    var player: AVAudioPlayer?
    
    func StartPlayer(track: String) {
        guard let url=Bundle.main.url(forResource: track, withExtension: "mp3") else {
            print("Resource not found \(track)")
            return
        }
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("error")
        }
    }
    //mute functionality is implemented by checking if state variabble of type bool 'sound' is set to 1. if so
    // on rolling dice, rollDice() will call StartPlayer(). Implementation works for small scale but is not
    // muting the soundmanager itself, it's just not playing the sound. If further sounds are added, code might get cluttered.
    //Seems more elegant to mute the sound manager, but it works for now.
}

