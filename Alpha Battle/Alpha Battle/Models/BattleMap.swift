//
//  BattleMap.swift
//  Alpha Battle
//
//  Created by Jimmy Lee on 12/13/23.
//

import Foundation

class Stage : NSObject, Codable {
  var name: String
  var enemyParty: Party
  var unlocked: Bool
  var completed: Bool
  var reward: Int
  var stageToUnlock: Stage?
  var selected: Bool

  private enum CodingKeys : String, CodingKey {
    case name, enemyParty, unlocked, completed, reward, stageToUnlock, selected
  }
  
  init(name: String,
       enemyParty: Party,
       unlocked: Bool,
       completed: Bool,
       reward: Int,
       stageToUnlock: Stage?,
       selected: Bool) {
    self.name = name
    self.enemyParty = enemyParty
    self.unlocked = unlocked
    self.completed = completed
    self.reward = reward
    self.stageToUnlock = stageToUnlock
    self.selected = selected
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(name, forKey: .name)
    try container.encode(enemyParty, forKey: .enemyParty)
    try container.encode(unlocked, forKey: .unlocked)
    try container.encode(completed, forKey: .completed)
    try container.encode(reward, forKey: .reward)
    try container.encode(stageToUnlock, forKey: .stageToUnlock)
    try container.encode(selected, forKey: .selected)
  }
  
  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    name = try container.decode(String.self, forKey: .name)
    enemyParty = try container.decode(Party.self, forKey: .enemyParty)
    unlocked = try container.decode(Bool.self, forKey: .unlocked)
    completed = try container.decode(Bool.self, forKey: .completed)
    reward = try container.decode(Int.self, forKey: .reward)
    stageToUnlock = try container.decode(Stage?.self, forKey: .stageToUnlock)
    selected = try container.decode(Bool.self, forKey: .selected)
  }
  
}

class BattleMap : NSObject, Codable {
  var myParty: Party
  var stages: [Stage]
  
  private enum CodingKeys : String, CodingKey {
    case myParty, stages
  }

  static func FightMapInitialSetUp(myParty: Party) -> BattleMap {
    let stage3 = Stage(name: "stage3",
                       enemyParty: Party([Character.GenerateGreenDelta(),
                                          Character.GenerateGreenDelta(),
                                          Character.GenerateGreenDelta()]),
                       unlocked: false, completed: false, reward: 30, stageToUnlock: nil, selected: false)
    let stage2 = Stage(name: "stage2",
                       enemyParty: Party([Character.GenerateBlueGamma(),
                                         Character.GenerateBlueGamma()]),
                       unlocked: true, completed: false, reward: 20, stageToUnlock: stage3, selected: false)
    let stage1 = Stage(name: "stage1",
                       enemyParty: Party([Character.GenerateRedBeta()]),
                       unlocked: true, completed: false, reward: 10, stageToUnlock: stage2, selected: true)
    let stages = [stage1, stage2, stage3]
    return BattleMap(myParty:myParty, stages: stages)
  }
  
  init(myParty: Party, stages: [Stage]) {
    self.myParty = myParty
    self.stages = stages
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(myParty, forKey: .myParty)
    try container.encode(stages, forKey: .stages)
  }
  
  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    myParty = try container.decode(Party.self, forKey: .myParty)
    stages = try container.decode([Stage].self, forKey: .stages)
  }
}
