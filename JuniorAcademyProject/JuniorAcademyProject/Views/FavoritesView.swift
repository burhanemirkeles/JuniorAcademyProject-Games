//
//  FavoritesView.swift
//  JuniorAcademyProject
//
//  Created by Emir Keleş on 14.06.2023.
//

import Foundation
import Carbon

class FavoritesView: UIView {

  let navigationBarLabel: UILabel = UILabel()
  let navigationBar = UINavigationBar()

  private struct Const {

    static let referencedSizeHeight: Double = 100.0

    static let navigationBarBackgroundColor: UIColor = UIColor(red: 248,
                                                               green: 248,
                                                               blue: 248,
                                                               alpha: 0.92)
    static let navigationBarTopItemTitle: String = "Navigation Bar"

    static let labelText = "Favorites"
    static let labelFont = UIFont(name: "Roboto-Bold", size: 34)
    static let labelTitleMinScaleFactor: CGFloat = 0.5

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
  }

  init() {
    super.init(frame: .zero)
    setupViews()
    setupConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setupViews() {
    self.addSubview(navigationBar)
    navigationBar.addSubview(navigationBarLabel)

    navigationBar.layer.cornerRadius = .zero
    navigationBar.tintColor = .white
    navigationBar.topItem?.title = Const.navigationBarTopItemTitle
    navigationBar.backgroundColor = Const.navigationBarBackgroundColor

    navigationBarLabel.textColor = .black
    navigationBarLabel.textAlignment = .left
    navigationBarLabel.numberOfLines = .zero
    navigationBarLabel.lineBreakMode = .byWordWrapping
    navigationBarLabel.textColor = .black
    navigationBarLabel.adjustsFontSizeToFitWidth = true
    navigationBarLabel.minimumScaleFactor = Const.labelTitleMinScaleFactor
    navigationBarLabel.baselineAdjustment = .alignCenters
    navigationBarLabel.text = Const.labelText
    navigationBarLabel.font = Const.labelFont
  }
  func setupConstraints() {
    navigationBar.snp.makeConstraints { (make) in
      make.height.equalTo(Const.NavigationBarConstraints.height)
      make.width.equalTo(Const.NavigationBarConstraints.width)
      make.left.equalToSuperview()
      make.top.equalToSuperview()
      make.right.equalToSuperview()
    }
    navigationBarLabel.snp.makeConstraints{ (make) in
      make.top.equalTo(navigationBar).offset(Const.LabelTitleConstraints.topOffset)
      make.left.equalToSuperview().offset(Const.LabelTitleConstraints.leftOffset)
      make.right.equalToSuperview().offset(Const.LabelTitleConstraints.rightOffset)
      make.bottom.equalTo(navigationBar).offset(Const.LabelTitleConstraints.bottomOffset)
      make.height.equalTo(Const.LabelTitleConstraints.height)
      make.width.equalTo(Const.LabelTitleConstraints.width)

    }
  }
}

extension FavoritesView: Component {
  func referenceSize(in bounds: CGRect) -> CGSize? {
    return CGSize(width: bounds.width, height: 100)
  }

  func renderContent() -> Content {
    return self
  }

  func render(in content: FavoritesView) { }
}
