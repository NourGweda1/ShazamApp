//
//  MainHomeView.swift
//  ShazamApp
//
//  Created by Nour Gweda on 16/08/2023.
//

import SwiftUI

struct MainHomeView: View {

    @StateObject internal var shazamSession = ShazamRecognizer()
    @State var isAnimating: Bool = false
    @State var track: Track?
    @State var firstColor: Color?
    @State var secondColor: Color?
    @State var thirdColor: Color?

    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                TrackView(track: $track, firstColor: $firstColor, secondColor: $secondColor,
                          thirdColor: $thirdColor)
                    .padding(.top, 10)

                Spacer()
            }
            
            HomeFooterView(isAnimating: $isAnimating,
                           firstColor: $firstColor,
                           secondColor: $secondColor,
                           thirdColor: $thirdColor) {
                shazamSession.listenMusic()
                isAnimating.toggle()
            }
        }.edgesIgnoringSafeArea(.bottom)
         .onChange(of: shazamSession.matchedTrack) { newValue in
             if newValue != nil {
                 isAnimating = false
                 track = newValue
                 shazamSession.stopRecording()
             }
         }
    }
}
