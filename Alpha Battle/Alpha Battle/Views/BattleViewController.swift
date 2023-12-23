//
//  BattleViewController.swift
//  Alpha Battle
//
//  Created by Jimmy Lee on 12/17/23.
//

import Foundation
import UIKit

class BattleViewController: UIViewController, BattleViewDelegate {
  var battleViewModel: BattleViewModel
  var battleView: BattleView? // can set presenting controller to self. is only used for back button
  
  init(_ battle: Battle) {
    let battleViewModel = BattleViewModel(battle: battle)
    battleViewModel.resetHp()
    self.battleViewModel = battleViewModel
    super.init(nibName: nil, bundle: nil)
    navigationItem.hidesBackButton = true
    battleView = BattleView(battleViewModel, presentingController: self)
    battleView?.delegate = self
    self.view = battleView
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func presentFightSequence() {
    let fightResultsViewModel = battleViewModel.getFightResults()
    battleView?.displayFightResults(fightResultsViewModel)
  }
}
