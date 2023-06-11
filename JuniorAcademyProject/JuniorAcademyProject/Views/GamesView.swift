//
//  GameView.swift
//  JuniorAcademyProject
//
//  Created by Emir Keleş on 11.06.2023.
//

import Foundation
import SnapKit
import Carbon
import UIKit

class GamesView: UIView, Component {

  let labelTitle: UILabel = UILabel()
  let navigationBar = UINavigationBar()

  let searchBar = UISearchBar()
  let stackView = UIStackView()

  private struct Const {

    static let referencedSizeHeight: Double = 100.0

    static let navigationBarBackgroundColor: UIColor = UIColor(red: 248,
                                                               green: 248,
                                                               blue: 248,
                                                               alpha: 0.92)
    static let navigationBarTopItemTitle: String = "Navigation Bar"

    static let labelText = "Games"
    static let labelFont = UIFont(name: "Roboto-Bold", size: 34)
    static let labelTitleMinScaleFactor: CGFloat = 0.5

    static let searchBarBackgroundColor: UIColor = UIColor(red: 142,
                                                           green: 142,
                                                           blue: 147,
                                                           alpha: 0.12)

    static let searchBarCornerRadius: CGFloat = 10.0
    static let searchBarPlaceholderText: String = "Search for the games"

    struct NavigationBarConstraints {
      static let height = 140
      static let width = 375
    }

    struct LabelTitleConstraints {
      static let topOffset = 90
      static let leftOffset = 16
      static let rightOffset = 250
      static let bottomOffset = -10
      static let height = 42
      static let width = 110
    }

    struct StackViewConstraints {
      static let topOffset = 2
      static let bottomOffset = -84
    }
  }

  init() {
    super.init(frame: .zero)
    setupViews()
    setupConstraints()
  }

  // MARK: - Component
  func render(in content: GamesView) { }

  func referenceSize(in bounds: CGRect) -> CGSize? {
    return CGSize(width: bounds.width, height: Const.referencedSizeHeight)
  }

  func renderContent() -> GamesView {
    return self
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  func setupConstraints() {
    navigationBar.snp.makeConstraints { (make) in
      make.height.equalTo(Const.NavigationBarConstraints.height)
      make.width.equalTo(Const.NavigationBarConstraints.width)
      make.left.equalToSuperview()
      make.top.equalToSuperview()
      make.right.equalToSuperview()
    }
    labelTitle.snp.makeConstraints{ (make) in
      make.top.equalTo(navigationBar).offset(Const.LabelTitleConstraints.topOffset)
      make.left.equalToSuperview().offset(Const.LabelTitleConstraints.leftOffset)
      make.right.equalToSuperview().offset(Const.LabelTitleConstraints.rightOffset)
      make.bottom.equalTo(navigationBar).offset(Const.LabelTitleConstraints.bottomOffset)
      make.height.equalTo(Const.LabelTitleConstraints.height)
      make.width.equalTo(Const.LabelTitleConstraints.width)

    }
    stackView.snp.makeConstraints{ (make) in
      make.top.equalTo(navigationBar.snp.bottom).offset(Const.StackViewConstraints.topOffset)
      make.bottom.equalToSuperview().offset(Const.StackViewConstraints.bottomOffset)
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
    }
    searchBar.snp.makeConstraints { make in

    }
  }

  func setupViews () {
    self.addSubview(navigationBar)
    navigationBar.addSubview(labelTitle)
    self.addSubview(stackView)
    stackView.addArrangedSubview(searchBar)

    navigationBar.layer.cornerRadius = .zero
    navigationBar.tintColor = .white
    navigationBar.topItem?.title = Const.navigationBarTopItemTitle
    navigationBar.backgroundColor = Const.navigationBarBackgroundColor

    labelTitle.textColor = .black
    labelTitle.textAlignment = .left
    labelTitle.numberOfLines = .zero
    labelTitle.lineBreakMode = .byWordWrapping
    labelTitle.textColor = .black
    labelTitle.adjustsFontSizeToFitWidth = true
    labelTitle.minimumScaleFactor = Const.labelTitleMinScaleFactor
    labelTitle.baselineAdjustment = .alignCenters
    labelTitle.text = Const.labelText
    labelTitle.font = Const.labelFont

    stackView.axis = .vertical
    stackView.contentMode = .scaleToFill
    stackView.alignment = .fill
    stackView.spacing = .zero
    stackView.distribution = .fill
    stackView.backgroundColor = .gray


    searchBar.backgroundColor = Const.searchBarBackgroundColor
    searchBar.layer.cornerRadius = Const.searchBarCornerRadius
    searchBar.placeholder = Const.searchBarPlaceholderText
    searchBar.searchTextField.font = UIFont.systemFont(ofSize: 17)

  }
}
