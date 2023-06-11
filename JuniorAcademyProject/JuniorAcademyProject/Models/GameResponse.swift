//
//  GameResponse.swift
//  JuniorAcademyProject
//
//  Created by Emir Keleş on 11.06.2023.
//

import Foundation

struct GameResponse: Codable {
    var results: [Game]
    var next: String?
}

