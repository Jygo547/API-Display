//
//  PlayerModels.swift
//  API Display
//
//  Created by ATLAS Checkout 6 Guest on 9/29/23.
//

import Foundation

struct PlayerResponse: Codable {
    var data: [Player]
    var meta: Meta

    struct Meta: Codable {
        var total_pages: Int
        var current_page: Int
        var next_page: Int
        var per_page: Int
        var total_count: Int
    }
}

struct Player: Codable, Identifiable {
    var id: Int
    var first_name: String
    var last_name: String
    var position: String
    var height_feet: Int?
    var height_inches: Int?
    var weight_pounds: Int?
    var team: Team
}

struct Team: Codable {
    var id: Int
    var abbreviation: String
    var city: String
    var conference: String
    var division: String
    var full_name: String
    var name: String
}

