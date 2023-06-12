//
//  CellView.swift
//  JuniorAcademyProject
//
//  Created by Emir Keleş on 12.06.2023.
//

import Foundation
import UIKit
import SnapKit
import Carbon


class CellView: UIView {
  var id: Int
  var titleLabel: UILabel = UILabel()
  var metacriticLabel: UILabel = UILabel()
  var metaScoreLabel: UILabel = UILabel()
  var genreTitleLabel: UILabel = UILabel()
  var imageView = UIImageView()

  weak var delegate: CellViewDelegate?

  override init(frame: CGRect) {
    self.id = 0
    super.init(frame: frame)

  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func configureViews() {
    addSubview(titleLabel)
    addSubview(metacriticLabel)
    addSubview(metaScoreLabel)
    addSubview(genreTitleLabel)

  }

  private func setupConstraints() {
    titleLabel.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(16)
      make.right.equalTo(-16)
      make.left.equalTo(152)
    }

    metacriticLabel.snp.makeConstraints { make in
        make.top.equalTo(84)
        make.right.equalTo(-147)
        make.left.equalTo(152)
    }

    metaScoreLabel.snp.makeConstraints { make in
        make.top.equalTo(metacriticLabel)
        make.right.equalTo(-121)
        make.left.equalTo(228)
        make.bottom.equalTo(metacriticLabel)
    }

    genreTitleLabel.snp.makeConstraints { make in
        make.top.equalTo(metacriticLabel.snp.bottom).offset(8)
        make.right.equalTo(-16)
        make.left.equalTo(152)
    }


  }


}

protocol CellViewDelegate: AnyObject {
  func didSelect()
}
