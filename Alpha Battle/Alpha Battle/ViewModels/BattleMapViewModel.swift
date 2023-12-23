//
//  BattleMapViewModel.swift
//  Alpha Battle
//
//  Created by Jimmy Lee on 12/13/23.
//

import Foundation

enum BattleNotifications {
  static let BattleDidSelectStageNotification = "BattleDidSelectStageNotification"
}

class StageViewModel: NSObject {
  var stage: Stage
  var stageName: String {
    get {
      return "\(stage.name)\n\(!stage.unlocked ? "(LOCKED)" : "")"
    }
  }
  var selected: Bool {
    get {
      return stage.selected
    }
  }
  
  init(_ stage: Stage) {
    self.stage = stage
  }
  
  func select(_ selected: Bool) {
    stage.selected = selected
  }
}

class BattleMapViewModel: NSObject {
  var stages: [StageViewModel]
  
  init(_ battleMap: BattleMap) {
    stages = []
    for stage in battleMap.stages {
      stages.append(StageViewModel(stage))
    }
  }
  
  func attemptSelectStage(_ selectedStageViewModel: StageViewModel) {
    if selectedStageViewModel.stage.unlocked == false {
      return
    }
    for stageViewModel in stages {
      stageViewModel.select(false)
    }
    selectedStageViewModel.select(true)
    NotificationCenter.default.post(name: Notification.Name(rawValue: BattleNotifications.BattleDidSelectStageNotification), object: self)
  }
  
  func selectedStage() -> StageViewModel? {
    for stageViewModel in stages {
      if (stageViewModel.selected) {
        return stageViewModel
      }
    }
    return nil
  }
}
