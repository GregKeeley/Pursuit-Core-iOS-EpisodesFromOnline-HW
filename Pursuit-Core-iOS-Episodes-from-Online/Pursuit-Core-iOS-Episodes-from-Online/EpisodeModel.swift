//
//  EpisodeModel.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Gregory Keeley on 12/15/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

struct Episodes: Decodable {
    let episodes: [Episode]
}

struct Episode: Decodable {
    let id: Double
    let name: String
    let season: String
    let number: String
    let image: ImageInfo
}

struct ImageInfo: Decodable {
    let medium: String
    let original: String
}
