//
//  GameModel.swift
//  JuniorAcademyProject
//
//  Created by Emir Keleş on 11.06.2023.
//

import Foundation

struct Game: Codable, Identifiable {
    let id: Int
    let name: String
    let genres: [Genre]?
    let gameImage: String?
    let metacritic: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case gameImage = "background_image"
        case metacritic
        case genres

    }
}
