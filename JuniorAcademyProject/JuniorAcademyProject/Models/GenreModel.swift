//
//  GenreModel.swift
//  JuniorAcademyProject
//
//  Created by Emir Keleş on 11.06.2023.
//

import Foundation

struct Genre: Codable {
  let name: String?

  enum CodingKeys: String, CodingKey {
    case name
  }
}
