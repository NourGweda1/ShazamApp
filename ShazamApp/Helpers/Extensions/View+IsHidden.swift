//
//  View+IsHidden.swift
//  ShazamApp
//
//  Created by Nour Gweda on 27/08/2023.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
