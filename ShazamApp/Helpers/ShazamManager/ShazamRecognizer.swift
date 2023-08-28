//
//  ShazamRecognizer.swift
//  ShazamApp
//
//  Created by Nour Gweda on 17/08/2023.
//

import Foundation
import ShazamKit
import AVKit
import SwiftUI

@MainActor
class ShazamRecognizer: NSObject, ObservableObject, SHSessionDelegate {
    @Published var session = SHSession()
    @Published var audioEngine = AVAudioEngine()

    @Published var errorMsg = ""
    @Published var showError = false
    @Published var isRecording = false
    @Published var matchedTrack: Track?
    

    override init() {
        super.init()
        session.delegate = self
    }

    func session(_ session: SHSession, didFind match: SHMatch) {
        if let firstItem = match.mediaItems.first {
            debugPrint(firstItem.title ?? "", "🎉")
            DispatchQueue.main.async {
                self.matchedTrack = Track(title: firstItem.title ?? "",
                                          artist: firstItem.artist ?? "",
                                          artwork: firstItem.artworkURL,
                                          genres: firstItem.genres,
                                          appleMusicURL: firstItem.appleMusicURL)
            }
        }
    }

    func session(_ session: SHSession, didNotFindMatchFor signature: SHSignature, error: Error?) {
        DispatchQueue.main.async {
            self.errorMsg = error?.localizedDescription ?? ""
            self.showError.toggle()
        }
    }

    func stopRecording() {
        audioEngine.stop()
        withAnimation {
            isRecording = false
        }
    }

    // fetch music
    func listenMusic() {
        let audioSession = AVAudioSession.sharedInstance()
        audioSession.requestRecordPermission { status in
            if status {
                self.recordAudio()
            } else {
                self.errorMsg = "Please Allow Microphone Access"
            }
        }
    }

    func recordAudio() {
        // check if recording then stop
        if audioEngine.isRunning {
            self.stopRecording()
            return
        }

        // create a node then listen to it
        let inputNode = audioEngine.inputNode
        let format = inputNode.outputFormat(forBus: .zero)

        // remove tap if already installed
        inputNode.removeTap(onBus: .zero)

        // install tap
        inputNode.installTap(onBus: .zero, bufferSize: 1024, format: format) { buffer, time in
            self.session.matchStreamingBuffer(buffer, at: time)
        }
        audioEngine.prepare()
        do {
            try audioEngine.start()
            debugPrint("Started")
            withAnimation {
                self.isRecording = true
            }
        } catch {
            self.errorMsg = error.localizedDescription
            self.showError.toggle()
        }
    }
}
