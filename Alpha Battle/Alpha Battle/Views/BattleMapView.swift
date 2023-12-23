//
//  BattleMapView.swift
//  Alpha Battle
//
//  Created by Jimmy Lee on 12/13/23.
//

import Foundation
import UIKit

protocol BattleMapViewDelegate : NSObject {
  func presentSelectedStage()
}

class BattleMapView: UIView, SelectableStageViewDelegate {
  var battleMapViewModel: BattleMapViewModel
  var stageScrollView: StageScrollView
  let backButton: BackButton
  let battleButton: UIButton
  let delegate: BattleMapViewDelegate
  
  init(battleMapViewModel: BattleMapViewModel,
       presentingController: UIViewController,
       delegate: BattleMapViewDelegate,
       frame: CGRect) {
    self.battleMapViewModel = battleMapViewModel
    stageScrollView = StageScrollView(stageViewModels: battleMapViewModel.stages)
    backButton = BackButton(controller: presentingController)
    battleButton = UIButton()
    self.delegate = delegate
    
    super.init(frame: frame)
    stageScrollView.setDelegate(self)
    backgroundColor = .orange
    battleButton.layer.cornerRadius = 10
    battleButton.backgroundColor = .white
    battleButton.setTitleColor(.black, for: .normal)
    battleButton.setTitle("BATTLE", for: .normal)
    battleButton.addTarget(self, action: #selector(didTapBattleButton), for: .touchUpInside)
    
    addSubview(stageScrollView)
    addSubview(battleButton)
    addSubview(backButton)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    let scrollViewX = 140.0
    let scrollViewY = 160.0
    let battleButtonXPadding = 130.0
    let battleButtonYPadding = 50.0
    let battleButtonWidth = 120.0
    let battleButtonHeight = 50.0
    let battleButtonX = self.frame.width - battleButtonWidth - battleButtonXPadding
    let battleButtonY = self.frame.height - battleButtonHeight - battleButtonYPadding
    backButton.frame = CGRect(origin: BackButtonOrigin, size: BackButtonSize)
    stageScrollView.frame = CGRect(x: scrollViewX, y: scrollViewY, width: self.frame.width, height: self.frame.height - scrollViewY)
    battleButton.frame = CGRect(x: battleButtonX, y: battleButtonY, width: battleButtonWidth, height: battleButtonHeight)
  }
  
  func attemptSelectStage(_ stage: StageViewModel) {
    battleMapViewModel.attemptSelectStage(stage)
  }
  
  func refreshStages() {
    stageScrollView.refreshScrollView()
  }
  
  @objc func didTapBattleButton() {
    delegate.presentSelectedStage()
  }
  
}
