//
//  CellItem.swift
//  JuniorAcademyProject
//
//  Created by Emir Keleş on 12.06.2023.
//

import Foundation
import Carbon
import Kingfisher

struct CellItem: IdentifiableComponent {

  func shouldContentUpdate(with next: CellItem) -> Bool {
    return true
  }

  var game: Game
  var id: String {
    game.name
  }

  func render(in content: CellView) {
    content.titleLabel.text = game.name
    content.titleLabel.font = UIFont(name: "Roboto-Bold", size: 20)
    content.metacriticLabel.text = "metacritic: "
    content.metacriticLabel.font = UIFont(name: "Roboto-Medium", size: 14.0)
    if let metacritic = game.metacritic {
        content.metaScoreLabel.text = String(metacritic)
        content.metaScoreLabel.textColor = .red
    }

    if let genres = game.genres {
        let genreNames = genres.compactMap { $0.name }
        if !genreNames.isEmpty {
            let joinedGenreNames = genreNames.joined(separator: ", ")
            content.genreTitleLabel.text = joinedGenreNames
        } else {
            content.genreTitleLabel.text = "N/A"
        }
      content.genreTitleLabel.font = UIFont(name: "Roboto-Thin", size: 12.0)
    }

    if let gameImage = game.gameImage, let url = URL(string: gameImage) {
        let resizeProcessor = ResizingImageProcessor(referenceSize: CGSize(width: 120, height: 104))
        let imageLoadingOptions: KingfisherOptionsInfo = [
            .processor(resizeProcessor),
            .scaleFactor(UIScreen.main.scale),
            .transition(.fade(0.2))
        ]
        content.imageView.kf.setImage(with: url, options: imageLoadingOptions)
    }

    content.id = game.id
}

  func referenceSize(in bounds: CGRect) -> CGSize? {
    return CGSize(width: bounds.width, height: 136)
  }
  
  func renderContent() -> CellView {
    return CellView()
  }

}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
