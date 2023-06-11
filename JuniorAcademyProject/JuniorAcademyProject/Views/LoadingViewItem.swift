//
//  LoadingViewItem.swift
//  JuniorAcademyProject
//
//  Created by Emir Keleş on 11.06.2023.
//

import Foundation
import Carbon

struct LoadingViewItem : IdentifiableComponent {

  func shouldContentUpdate(with next: LoadingViewItem) -> Bool { return false }

  var id = 1

  // MARK: - Component
  func render(in content: LoadingCellView) { }

  func referenceSize(in bounds: CGRect) -> CGSize? {
    return CGSize(width: bounds.width, height: 136)
  }

  func renderContent() -> LoadingCellView {
    return LoadingCellView()
  }

}
