//
//  GameDetailView.swift
//  JuniorAcademyProject
//
//  Created by Emir Keleş on 13.06.2023.
//

import Foundation
import UIKit
import SnapKit
import Carbon

final class GameDetailView: UIView, Component {
  
  func render(in content: GameDetailView) { }

  func renderContent() -> GameDetailView {
    return self
  }

  func referenceSize(in bounds: CGRect) -> CGSize? {
    return CGSize(width: bounds.width, height: 100)
  }

  var id: Int = 0
  var titleLabel: UILabel = UILabel()
  var metaScoreLabel: UILabel = UILabel()
  var gameDescriptionLabel: UILabel = UILabel()
  var gameDescription: UILabel = UILabel()
  var imageView = UIImageView()
  var visitRedditButton = UIButton()
  var visitWebsiteButton = UIButton()
  var redditUrl: String?
  var websiteUrl: String?
  var firstSeperatorView = UIView()
  var secondSepartorView = UIView()

  override init(frame: CGRect) {
    super.init(frame: frame)
    configureViews()
    setupConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func configureViews() {

    self.addSubview(imageView)
    self.addSubview(titleLabel)
    self.addSubview(metaScoreLabel)
    self.addSubview(gameDescriptionLabel)
    self.addSubview(gameDescription)
    self.addSubview(firstSeperatorView)
    self.addSubview(visitRedditButton)
    self.addSubview(secondSepartorView)
    self.addSubview(visitWebsiteButton)

    titleLabel.font = UIFont(name: "Roboto-Bold", size: 36)
    titleLabel.textColor = .white
    titleLabel.textAlignment = .right


    gameDescription.text = "Game Description"
    gameDescription.font = UIFont(name: "Roboto-Regular", size: 18)
    gameDescription.numberOfLines = 4
    gameDescription.translatesAutoresizingMaskIntoConstraints = false

    firstSeperatorView.backgroundColor = .gray

    visitRedditButton.setTitle("Visit Reddit", for: .normal)
    visitRedditButton.setTitleColor(.black, for: .normal)
    visitRedditButton.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 59)
    visitRedditButton.contentHorizontalAlignment = .left

    visitRedditButton.addTarget(self, action: #selector(visitButtonTapped), for: .touchUpInside)

    secondSepartorView.backgroundColor = .gray

    visitWebsiteButton.setTitle("Visit Website", for: .normal)
    visitWebsiteButton.setTitleColor(.black, for: .normal)
    visitWebsiteButton.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 59)
    visitWebsiteButton.contentHorizontalAlignment = .left

    visitWebsiteButton.addTarget(self, action: #selector(visitButtonTapped), for: .touchUpInside)
  }


  @objc func visitButtonTapped() {
    if let redditUrl = redditUrl, let url = URL(string: redditUrl) {
      UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    if let websiteUrl = websiteUrl, let url = URL(string: websiteUrl) {
      UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
  }

  private func setupConstraints() {

    imageView.snp.makeConstraints { make in
      make.top.equalTo(0)
      make.left.right.equalToSuperview()
      make.height.equalTo(292)
      make.leading.trailing.equalTo(0)
    }

    titleLabel.snp.makeConstraints { make in
      make.bottom.equalTo(imageView.snp.bottom).offset(-16)
      make.left.equalToSuperview().offset(16)
      make.right.equalToSuperview().offset(-16)
    }

    gameDescriptionLabel.snp.makeConstraints { make in
      make.top.equalTo(imageView.snp.bottom).offset(16)
      make.left.equalTo(16)
      make.right.equalTo(-16)
    }

    gameDescription.snp.makeConstraints { make in
      make.top.equalTo(gameDescriptionLabel.snp.bottom).offset(8)
      make.left.equalTo(16)
      make.right.equalTo(-16)
      make.height.equalTo(82)
    }

    firstSeperatorView.snp.makeConstraints { make in
      make.top.equalTo(gameDescription.snp.bottom).offset(16)
      make.left.equalTo(16)
      make.right.equalTo(-16)
      make.height.equalTo(1)
    }

    visitRedditButton.snp.makeConstraints { make in
      make.top.equalTo(firstSeperatorView.snp.bottom).offset(32)
      make.left.equalTo(16)
      make.right.equalTo(-16)
    }

    secondSepartorView.snp.makeConstraints { make in
      make.top.equalTo(visitRedditButton.snp.bottom).offset(16)
      make.left.equalTo(16)
      make.right.equalTo(-16)
      make.height.equalTo(1)
    }

    visitWebsiteButton.snp.makeConstraints { make in
      make.top.equalTo(secondSepartorView.snp.bottom).offset(32)
      make.left.equalTo(16)
    }

  }

}

