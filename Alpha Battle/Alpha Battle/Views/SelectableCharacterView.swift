//
//  SelectableCharacterView.swift
//  Alpha Battle
//
//  Created by Jimmy Lee on 12/10/23.
//

import Foundation
import UIKit

protocol SelectableCharacterViewDelegate: NSObject {
  func didSelectCharacterViewModel(_ characterViewModel: CharacterViewModel)
}

class SelectableCharacterView: UIView {
  var characterView: CharacterView
  var characterViewModel: CharacterViewModel
  var button: UIButton
  var delegate: SelectableCharacterViewDelegate

  init(characterViewModel: CharacterViewModel, frame: CGRect, selected: Bool, delegate: SelectableCharacterViewDelegate) {
    characterView = CharacterView(characterViewModel)
    self.characterViewModel = characterViewModel
    button = UIButton()
    self.delegate = delegate
    super.init(frame: frame)
    button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    addSubview(characterView)
    addSubview(button)
    if (selected) {
      layer.borderColor = UIColor.gray.cgColor
      layer.borderWidth = 4.0
    } else {
      layer.borderWidth = 0.0
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    characterView.frame = CGRect(x: bounds.origin.x, y: -5.0, width: bounds.size.width, height: bounds.size.height)
    button.frame = bounds
  }
  
  @objc private func didTapButton() {
    delegate.didSelectCharacterViewModel(characterViewModel)
  }

}
