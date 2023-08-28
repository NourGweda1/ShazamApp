//
//  Track.swift
//  ShazamApp
//
//  Created by Nour Gweda on 20/08/2023.
//

import Foundation

struct Track: Identifiable, Equatable {
    var id = UUID().uuidString
    var title: String
    var artist: String
    var artwork: URL?
    var genres: [String]
    var appleMusicURL: URL?
}
