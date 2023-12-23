//
//  BattleCharacterView.swift
//  Alpha Battle
//
//  Created by Jimmy Lee on 12/19/23.
//

import Foundation
import UIKit

class BattleCharacterView: UIView {
  var characterViewModel: CharacterViewModel
  var characterView: CharacterView
  var lifeView: UILabel
  
  init(_ characterViewModel: CharacterViewModel) {
    self.characterViewModel = characterViewModel
    characterView = CharacterView(characterViewModel)
    lifeView = UILabel()
    super.init(frame: CGRectZero)
    lifeView.text = "\(characterViewModel.getCurrentHp())"
    lifeView.backgroundColor = UIColor(hex:"#d9c5f2ff")
    lifeView.textColor = .black
    lifeView.textAlignment = .center
    
    addSubview(lifeView)
    addSubview(characterView)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    characterView.frame = self.bounds
    let halfwidth = self.bounds.width / 2.0
    lifeView.frame = CGRect(x: halfwidth, y: 0, width: halfwidth, height: halfwidth)
  }
}
