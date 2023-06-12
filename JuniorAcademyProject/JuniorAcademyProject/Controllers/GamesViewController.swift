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
  private let tableView: UITableView = UITableView()
  var viewModel: GamesViewModel = GamesViewModel()

  private let renderer = Renderer(adapter: TableViewAdapter(),
                                  updater: UITableViewUpdater())
  
  override func viewDidLoad() {
    super.viewDidLoad()

    view.addSubview(gamesView)
    configureGamesView(gamesView)

    viewModel.delegate = self
    viewModel.fetchGames()

    renderer.target = tableView
    
    configureTableView()

  }

  private func configureGamesView(_ view: UIView) {

    gamesView.snp.makeConstraints { (make) in
      make.top.equalTo(0)
      make.leading.trailing.equalTo(0)
      make.height.equalTo(gamesView.snp.height)
    }
  }

  private func configureTableView() {
    view.addSubview(tableView)
    tableView.snp.makeConstraints { (make) in
      make.top.equalTo(gamesView.searchBar.snp.bottom)
      make.leading.equalTo(0)
      make.trailing.equalTo(0)
      make.bottom.equalToSuperview().offset(-82)
    }
    tableView.separatorStyle = .none
    tableView.contentInset = UIEdgeInsets(top: -20, left: 0, bottom: 0, right: 0)
  }

  func render() {
    var nodes: [CellNode] = []

    if viewModel.games.isEmpty {
      let emptyCell = CellNode(id: "EmptyCell", EmptyItem())
      nodes.append(emptyCell)
    } else {
      for game in viewModel.games {
        let gameCell = CellNode(id: "GameCell", CellItem(game: game))
        nodes.append(gameCell)
      }
    }
    
    let gamesSection = Section(id: "gameSection", cells: nodes)
    renderer.render(gamesSection)
  }
  
}
// MARK: GamesViewModelDelegate
extension GamesViewController: GamesViewModelDelegate {

  func didFetchGamesData() { render() }

  func searchGame() { render() }

  func didFetchMoreGames() { render() }

  func getGameDetail() { }

}


