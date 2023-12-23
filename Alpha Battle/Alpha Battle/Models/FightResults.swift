//
//  FightResults.swift
//  Alpha Battle
//
//  Created by Jimmy Lee on 12/19/23.
//

import Foundation

class FightResults{
  var textUpdates: [String] = []
  var myPartyUpdates: [Party] = []
  var enemyPartyUpdates: [Party] = []
  
  init(textUpdates: [String], myPartyUpdates: [Party], enemyPartyUpdates: [Party]) {
    self.textUpdates = textUpdates
    self.myPartyUpdates = myPartyUpdates
    self.enemyPartyUpdates = enemyPartyUpdates
  }
}
