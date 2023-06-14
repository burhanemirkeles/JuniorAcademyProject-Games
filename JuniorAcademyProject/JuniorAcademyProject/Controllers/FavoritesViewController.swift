//
//  FavoritesViewController.swift
//  JuniorAcademyProject
//
//  Created by Emir Keleş on 12.06.2023.
//

import UIKit

class FavoritesViewController: UIViewController {

  let favoritesView = FavoritesView()
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(favoritesView)

  }

}

extension FavoritesViewController: GamesViewModelDelegate {

  func didFetchGamesData() { }
  func searchGame() { }
  func didFetchMoreGames() { }
  func getGameDetail() { }


}
