//
//  CellItem.swift
//  JuniorAcademyProject
//
//  Created by Emir Keleş on 12.06.2023.
//

import Foundation
import Carbon

struct CellItem: IdentifiableComponent {

  var game: Game
  var id: String {
    game.name
  }

  func renderContent() -> CellView {
    return CellView()
  }

  func render(in content: CellView) {
    content.titleLabel.text = game.name
    content.metacriticLabel.text = "metacritic:"
    if let metacritic = game.metacritic {
        content.metaScoreLabel.text = String(metacritic)
    }

    if let genres = game.genres {
        let genreNames = genres.compactMap { $0.name }
        if !genreNames.isEmpty {
            let joinedGenreNames = genreNames.joined(separator: ", ")
            content.genreTitleLabel.text = joinedGenreNames
        } else {
            content.genreTitleLabel.text = "N/A"
        }
    }


    content.id = game.id
}

  func referenceSize(in bounds: CGRect) -> CGSize? {
    return CGSize(width: bounds.width, height: 136)
  }

  func shouldContentUpdate(with next: CellItem) -> Bool {
    return false
  }

}
