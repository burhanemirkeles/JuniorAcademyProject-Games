//
//  EmptyStateView.swift
//  JuniorAcademyProject
//
//  Created by Emir Keleş on 11.06.2023.
//

import Foundation
import SnapKit
import Carbon
import UIKit

final class EmptyView: UIView {

  var emptyLabel: UILabel = UILabel()

  private struct Const {
    static let emptyLabelText: String = "No game has been searched.."
    static let emptyLabelFont = UIFont(name: "Roboto-Bold", size: 18)
    static let emptyLabelMinScaleFactor: CGFloat = 0.5

    static let emptyLabelTopOffset = 38
  }

  override init(frame: CGRect){
    super.init(frame: frame)
    setupViews()
    setupConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


  func setupViews () {
    self.addSubview(emptyLabel)

    emptyLabel.textColor = .black
    emptyLabel.textAlignment = .center
    emptyLabel.numberOfLines = .zero
    emptyLabel.lineBreakMode = .byWordWrapping
    emptyLabel.textColor = .black
    emptyLabel.adjustsFontSizeToFitWidth = true
    emptyLabel.minimumScaleFactor = Const.emptyLabelMinScaleFactor
    emptyLabel.baselineAdjustment = .alignCenters
    emptyLabel.text = Const.emptyLabelText
    emptyLabel.font = Const.emptyLabelFont
  }

  func setupConstraints(){
    emptyLabel.snp.makeConstraints{ (make) in
      make.top.equalToSuperview().offset(Const.emptyLabelTopOffset)
      make.centerX.equalToSuperview()

    }
  }
}
