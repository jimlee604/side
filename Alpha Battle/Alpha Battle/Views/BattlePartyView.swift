//
//  BattlePartyView.swift
//  Alpha Battle
//
//  Created by Jimmy Lee on 12/18/23.
//

import Foundation
import UIKit

class BattlePartyView: UIView {
  var battlePartyViewModel: BattlePartyViewModel
  var characterViews: [BattleCharacterView] = []

  init(_ battlePartyViewModel: BattlePartyViewModel) {
    self.battlePartyViewModel = battlePartyViewModel
    super.init(frame: CGRectZero)
    for characterViewModel in battlePartyViewModel.characterViewModels {
      let characterView = BattleCharacterView(characterViewModel)
      characterViews.append(characterView)
      addSubview(characterView)
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    var x = 0.0
    let xBuffer = 20.0
    let width = 100.0
    for characterView in characterViews {
      characterView.frame = CGRect(x: x, y: 0, width: width, height: width)
      x += xBuffer + width
    }
  }
}
