//
//  HomeFooterView.swift
//  ShazamApp
//
//  Created by Nour Gweda on 23/08/2023.
//

import SwiftUI

struct HomeFooterView: View {

    // MARK: - Binding variables
    @Binding var isAnimating: Bool
    @Binding var internalColors: InternalColors?
    @Binding var firstColor: Color?
    @Binding var secondColor: Color?
    @Binding var thirdColor: Color?

    // MARK: - Action variables
    var searchAction: (() -> Void)

    var body: some View {
        ZStack(alignment: .bottom) {
            WaveForm(isAnimating: $isAnimating,
                     color: $firstColor.toUnwrapped(defaultValue: Color(UIColor(Color.customColors.lightYellow.opacity(0.8)))),
                     amplify: 400)
                .frame(height: 650)

            WaveForm(isAnimating: $isAnimating,
                     color: $secondColor.toUnwrapped(defaultValue: Color(UIColor(Color.customColors.lightYellow))),
                     amplify: 250)
                .scaleEffect(x: -1, y: 1)
                .frame(height: 400)

            WaveForm(isAnimating: .constant(false),
                     color: $thirdColor.toUnwrapped(defaultValue: Color(UIColor(Color.customColors.lightBrown))),
                     amplify: 200)
                .frame(height: 200)

            // BUTTON SEARCH FOR SONGS

            Button {
                searchAction()
            } label: {
                Image(systemName: isAnimating ? "mic.slash" : "mic.fill")
                    .foregroundColor(.customColors.lightBrown)
                    .padding()
                    .background {
                        Circle()
                            .fill(.white)
                            .frame(width: 60, height: 60)
                            .overlay(
                                Circle()
                                    .stroke(Color.customColors.lightBrown, lineWidth: 1)
                            )
                    }
            }
            .padding(.bottom, 60)
            .padding(.leading, 70)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
