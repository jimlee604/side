//
//  BattleMapViewController.swift
//  Alpha Battle
//
//  Created by Jimmy Lee on 12/13/23.
//

import Foundation
import UIKit

class BattleMapViewController: UIViewController, BattleMapViewDelegate {
  var battleMap: BattleMap
  var battleMapViewModel: BattleMapViewModel
  var battleMapView: BattleMapView?
  
  init(battleMap: BattleMap) {
    self.battleMap = battleMap
    self.battleMapViewModel = BattleMapViewModel(battleMap)
    super.init(nibName: nil, bundle: nil)
    navigationItem.hidesBackButton = true
    battleMapView = BattleMapView(battleMapViewModel:BattleMapViewModel(battleMap),
                                  presentingController: self,
                                  delegate: self,
                                  frame: view.frame)
    view = battleMapView
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(battleDidSelectStage(_:)),
                                           name: NSNotification.Name(rawValue: BattleNotifications.BattleDidSelectStageNotification),
                                           object: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  @objc private func battleDidSelectStage(_ notification: NSNotification) {
    battleMapView!.refreshStages()
  }
  
  func presentSelectedStage() {
    let myParty = battleMap.myParty
    let enemyParty = battleMapViewModel.selectedStage()?.stage.enemyParty
    let battle = Battle(myParty: myParty, enemyParty: enemyParty!)
    let battleVC = BattleViewController(battle)
    navigationController?.pushViewController(battleVC, animated: false)
  }
}
