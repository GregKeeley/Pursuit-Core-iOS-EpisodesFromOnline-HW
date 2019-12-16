//
//  ShowModel.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Gregory Keeley on 12/15/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import Foundation

struct ShowData: Decodable {
    let shows: [ShowSearch]
}
struct ShowSearch: Decodable {
    let show: Show
}

struct Show: Decodable {
    let id: Double
    let name: String
    let image: ImageSizes
    let rating: RatingData
}

struct RatingData: Decodable {
    let average: Double
}

struct ImageSizes: Decodable {
    let medium: String
    let original: String
}
