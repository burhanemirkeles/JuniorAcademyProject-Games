//
//  LoadingView.swift
//  JuniorAcademyProject
//
//  Created by Emir Keleş on 11.06.2023.
//

import Foundation
import SnapKit

final class LoadingCellView: UIView {

  var loadingBar: UIActivityIndicatorView = UIActivityIndicatorView(style: .medium)
  private let loadingBarTopOffset = 38

  override init(frame: CGRect){
    super.init(frame: frame)
    setupViews()
    setupConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setupViews () {
    self.addSubview(loadingBar)

    loadingBar.color = .blue
    loadingBar.startAnimating()
  }

  func setupConstraints() {
    loadingBar.snp.makeConstraints{ (make) in
      make.top.equalToSuperview().offset(loadingBarTopOffset)
      make.left.equalToSuperview()
      make.right.equalToSuperview()
      make.centerX.equalToSuperview()
    }
  }

}


