//
//  GameDetailViewController.swift
//  JuniorAcademyProject
//
//  Created by Emir Keleş on 12.06.2023.
//

import Foundation
import Carbon
import UIKit

class GameDetailViewController: UIViewController, GamesViewModelDelegate {
  func didFetchGamesData() {
    render()
  }

  func searchGame() {
    render()
  }

  func didFetchMoreGames() {
    render()
  }

  func getGameDetail() {
    render()
  }

  var gameId: Int?
  let gameDetailView = GameDetailView()
  private let tableView: UITableView = UITableView()

  private let renderer = Renderer(adapter: UITableViewAdapter(),
                                 updater: UITableViewUpdater())
  var viewModel: GamesViewModel = GamesViewModel()


  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    viewModel.delegate = self
    viewModel.getDetailGames(gameID: gameId ?? 0)
    renderer.target = tableView
    configureTableView()
  }

  func render() {
    var nodes: [CellNode] = []

    let gameDetailNode = CellNode(GameDetailItem(
      gameDetail: GameDetail(
        id: viewModel.gameDetail?.id ?? 0,
        name: viewModel.gameDetail?.name ?? "",
        backgroundImage: viewModel.gameDetail?.backgroundImage ?? "",
        description: viewModel.gameDetail?.description ?? "", redditUrl: viewModel.gameDetail?.redditUrl ?? "",
        website: viewModel.gameDetail?.website ?? "",
        genres: viewModel.gameDetail?.genres ?? [],
        metacritic: viewModel.gameDetail?.metacritic ?? 0
      )
    ))
    nodes.append(gameDetailNode)

    let detailSection = Section(id: "DetailSection", cells: nodes)
    renderer.render(detailSection)
    
  }

  private func configureTableView() {
    view.addSubview(tableView)

    tableView.snp.makeConstraints { make in
      make.top.equalTo(88)
      make.leading.equalTo(0)
      make.trailing.equalTo(0)
      make.bottom.equalToSuperview().offset(0)
     }
      tableView.separatorStyle = .none
//      tableView.contentInset = UIEdgeInsets(top: -20, left: 0, bottom: 0, right: 0)
  }
}
