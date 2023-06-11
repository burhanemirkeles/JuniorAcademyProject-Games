//
//  EmptyViewItem.swift
//  JuniorAcademyProject
//
//  Created by Emir Keleş on 11.06.2023.
//

import Foundation
import Carbon


struct EmptyItem : IdentifiableComponent {

  var id = 1
  let referenceSizeHeight: CGFloat = 136

  // MARK: - Component
  func render(in content: EmptyView) { }

  func referenceSize(in bounds: CGRect) -> CGSize? {
    return CGSize(width: bounds.width, height: referenceSizeHeight)
  }

  func renderContent() -> EmptyView {
    return EmptyView()
  }

  func shouldContentUpdate(with next: EmptyItem) -> Bool {
    return false
  }

}
