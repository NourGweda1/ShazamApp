//
//  WaveForm+Extension.swift
//  ShazamApp
//
//  Created by Nour Gweda on 20/08/2023.
//

import Foundation
import SwiftUI

extension WaveForm {

    func getPath(size: CGSize) -> Path {
        return Path { path in
            let midHeight = size.height / 2
            let width = size.width

            path.move(to: CGPoint(x: 0, y: midHeight))
            path.addCurve(to: CGPoint(x: width, y: midHeight),
                          control1: CGPoint(x: width * 0.4,
                                            y: midHeight + amplify),
                          control2: CGPoint(x: width * 0.65,
                                            y: midHeight - amplify))

            path.addLine(to: CGPoint(x: width, y: size.height))
            path.addLine(to: CGPoint(x: 0, y: size.height))
        }
    }

}
