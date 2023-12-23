//
//  FightResultsViewModel.swift
//  Alpha Battle
//
//  Created by Jimmy Lee on 12/19/23.
//

import Foundation

class FightResultsViewModel: NSObject {
  var textUpdates: [String] = []
  var myPartyUpdates: [BattlePartyViewModel] = []
  var enemyPartyUpdates: [BattlePartyViewModel] = []
  
  init(_ fightResults: FightResults) {
    textUpdates = fightResults.textUpdates
    for party in fightResults.myPartyUpdates {
      myPartyUpdates.append(BattlePartyViewModel(party, position: .mine))
    }
    for party in fightResults.enemyPartyUpdates {
      enemyPartyUpdates.append(BattlePartyViewModel(party, position: .enemy))
    }
  }
}
