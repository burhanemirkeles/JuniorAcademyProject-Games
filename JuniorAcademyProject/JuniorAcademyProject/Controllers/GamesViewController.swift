//
//  ViewController.swift
//  JuniorAcademyProject
//
//  Created by Emir Keleş on 29.05.2023.
//

import UIKit
import Carbon
import SnapKit

class GamesViewController: UIViewController {

  let gamesView = GamesView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(gamesView)
    configureGamesView(gamesView)
  }

  private func configureGamesView(_ view: UIView) {

    gamesView.snp.makeConstraints { (make) in
      make.top.equalTo(0)
      make.leading.trailing.equalTo(0)
      make.height.equalTo(gamesView.snp.height)
    }

  }
  
}


