//
//  PartyView.swift
//  Alpha Battle
//
//  Created by Jimmy Lee on 12/8/23.
//

import Foundation
import UIKit

class PartyView: UIView {
  var partyViewModel: PartyViewModel
  var characterViews: [CharacterView]
  var backButton: UIButton
  
  init(partyViewModel:PartyViewModel, presentingController:UIViewController, frame: CGRect) {
    self.partyViewModel = partyViewModel
    self.characterViews = []
    backButton = BackButton(controller: presentingController)
    super.init(frame: frame)
    backgroundColor = .gray
    addSubview(backButton)
    for characterViewModel in partyViewModel.characterViewModels {
      let characterView = CharacterView(characterViewModel)
      characterViews.append(characterView)
      addSubview(characterView)
    }
  
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    var index = 0
    let padding = 50.0
    let sharedSpace = self.frame.width - padding * 2.0
    let segmentWidth = sharedSpace / Double(maxPartySize)
    backButton.frame = CGRect(origin: BackButtonOrigin, size: BackButtonSize)
    for characterView in characterViews {
      characterView.frame = CGRect(x: padding + Double(index) * segmentWidth, y: 100, width: segmentWidth, height: segmentWidth)
      characterView.setNeedsLayout()
      index += 1
    }
  }
                
}
