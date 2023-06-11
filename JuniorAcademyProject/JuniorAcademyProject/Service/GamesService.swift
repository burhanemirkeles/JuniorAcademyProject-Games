//
//  GamesService.swift
//  JuniorAcademyProject
//
//  Created by Emir Keleş on 11.06.2023.
//

import Alamofire

struct AlamofireService {

  struct Const {
    static let scheme: String = "https"
    static let host: String = "api.rawg.io"
    static let path: String = "/api/games"
    static let queryItems: [URLQueryItem] = [URLQueryItem(name: "key", value: "99754714091e4d8d82257b2bd4825d84")]

    static let timeoutInterval: TimeInterval = 120.0

    static let searchText: String = "search"
  }
    static let shared = AlamofireService()

    func getDefaultRequest(url:String, method: HTTPMethod, params: [String:AnyObject] = [:]) -> URLRequest {
        var request = URLRequest(url: URL(string:url)!)
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        request.timeoutInterval = Const.timeoutInterval
        request.method = method
        if(!params.isEmpty) {
            request.httpBody = try? JSONSerialization.data(withJSONObject: params)
        }
        return request
    }

    func getUrlComponent() -> URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = Const.scheme
        urlComponents.host = Const.host
        urlComponents.path = Const.path
        urlComponents.queryItems = Const.queryItems

        return urlComponents
    }

  func requestGetGames(completion: @escaping (Result<([Game], String?), Error>) -> Void) {
      let request = self.getDefaultRequest(url: getUrlComponent().url!.absoluteString, method: .get)

      AF.request(request).responseDecodable(of: GameResponse.self) { response in
          switch response.result {
          case .success(let gameResponse):
              completion(.success((gameResponse.results, gameResponse.next)))
          case .failure(let error):
              completion(.failure(error))
          }
      }
  }

  func requestGetGamesWithSearch(searchText: String, completion: @escaping (Result<[Game], Error>) -> Void) {
      var urlComponents = getUrlComponent()
      let searchQuery = URLQueryItem(name: Const.searchText, value: searchText)
      urlComponents.queryItems?.append(searchQuery)

      guard let url = urlComponents.url else {return}

      let request = self.getDefaultRequest(url: url.absoluteString, method: .get)

      AF.request(request).responseDecodable(of: GameResponse.self) { response in
          switch response.result {
          case .success(let gameResponse):
              completion(.success(gameResponse.results))
          case .failure(let error):
              completion(.failure(error))
          }
      }
  }

  func requestGetGamesDetail(gameID: Int, completion: @escaping (Result<GameDetail, Error>) -> Void) {
    var urlComponents = URLComponents()
    urlComponents.scheme = Const.scheme
    urlComponents.host = Const.host
    urlComponents.path = "\(Const.path)/\(gameID)"
    urlComponents.queryItems = Const.queryItems

    print("AlamofireService --> \(urlComponents.url!.absoluteString) adresine istek atılıyor...")

    guard let url = urlComponents.url else { return }

    let request = self.getDefaultRequest(url: url.absoluteString, method: .get)

    AF.request(request).responseDecodable(of: GameDetail.self) { response in
      switch response.result {
      case .success(let gameDetailResponse):
        completion(.success(gameDetailResponse))
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
  func requestGetMoreGames(nextPage: String?, completion: @escaping (Result<([Game], String?), Error>) -> Void) {

    if let nextPage = nextPage {
      let request = self.getDefaultRequest(url: nextPage, method: .get)
      AF.request(request).responseDecodable(of: GameResponse.self) { response in
          switch response.result {
          case .success(let gameResponse):
              completion(.success((gameResponse.results, gameResponse.next)))
          case .failure(let error):
              completion(.failure(error))
          }
      }
    }
  }
}
