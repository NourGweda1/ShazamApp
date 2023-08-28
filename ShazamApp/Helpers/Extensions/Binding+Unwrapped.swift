//
//  Binding+Unwrapped.swift
//  ShazamApp
//
//  Created by Nour Gweda on 28/08/2023.
//

import Foundation
import SwiftUI

extension Binding {
     func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == T? {
        Binding<T>(get: { self.wrappedValue ?? defaultValue }, set: { self.wrappedValue = $0 })
    }
}
