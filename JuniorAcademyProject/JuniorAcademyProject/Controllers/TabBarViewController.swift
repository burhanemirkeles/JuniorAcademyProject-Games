//
//  TabBarViewController.swift
//  JuniorAcademyProject
//
//  Created by Emir Keleş on 12.06.2023.
//

import UIKit

class TabBarController: UITabBarController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white

    let firstViewController = GamesViewController()
    firstViewController.tabBarItem = UITabBarItem(title: "Games",
                                                  image: UIImage(named: "gamesIcon"),
                                                  selectedImage: UIImage(named: "gamesIconSelected"))

    let secondViewController = FavoritesViewController()
    secondViewController.tabBarItem = UITabBarItem(title: "Favorites",
                                                   image: UIImage(named: "favoritesIcon"),
                                                   selectedImage: UIImage(named: "favoritesIconSelected"))


    viewControllers = [firstViewController, secondViewController]
  }

}
