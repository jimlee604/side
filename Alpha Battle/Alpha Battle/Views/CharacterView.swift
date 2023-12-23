//
//  CharacterView.swift
//  Alpha Battle
//
//  Created by Jimmy Lee on 12/8/23.
//

import Foundation
import UIKit

class CharacterView: UIView {
  let labelView: UILabel = UILabel()
  
  init(_ characterViewModel: CharacterViewModel) {
    super.init(frame: CGRectZero)
    let textAttributes: [NSAttributedString.Key : Any] =
    [ NSAttributedString.Key.font : UIFont(name: "ChalkboardSE-Bold", size:40.0)!,
      NSAttributedString.Key.foregroundColor : UIColor(hex: characterViewModel.colorHex)!]
    labelView.attributedText = NSAttributedString(string: characterViewModel.name, attributes: textAttributes)
    labelView.textAlignment = .center
    addSubview(labelView)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    labelView.frame = bounds
  }
}
