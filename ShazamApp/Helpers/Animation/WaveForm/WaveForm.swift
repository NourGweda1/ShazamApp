//
//  WaveForm.swift
//  ShazamApp
//
//  Created by Nour Gweda on 20/08/2023.
//

import SwiftUI

struct WaveForm: View {

    // MARK: - Binding variables
    @Binding var isAnimating: Bool
    @Binding var color: Color

    // MARK: - Locale variables
    var amplify: CGFloat

    var body: some View {
        TimelineView(.animation) { timeLine in
            Canvas { context, size in
                if isAnimating {
                    let timeNow = timeLine.date.timeIntervalSinceReferenceDate
                    let angle = timeNow.remainder(dividingBy: 2)
                    let offset = angle * size.width

                    context.translateBy(x: offset, y: 0)

                }
                context.fill(getPath(size: size), with: .color(color.opacity(0.3)))

                context.translateBy(x: -size.width, y: 0)

                context.fill(getPath(size: size), with: .color(color.opacity(0.3)))

                context.translateBy(x: size.width * 2, y: 0)

                context.fill(getPath(size: size), with: .color(color.opacity(0.3)))
            }
        }
    }
}
