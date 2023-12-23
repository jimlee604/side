//
//  BattlePartyViewModel.swift
//  Alpha Battle
//
//  Created by Jimmy Lee on 12/18/23.
//

import Foundation

enum BattlePartyPosition {
  case mine, enemy
}

class BattlePartyViewModel: NSObject {
  var party: Party
  var position: BattlePartyPosition
  var characterViewModels: [CharacterViewModel] {
    get {
      var result: [CharacterViewModel] = []
      for character in party.partyMembers {
        result.append(CharacterViewModel(character))
      }
      return result
    }
  }
  
  init(_ party: Party, position: BattlePartyPosition) {
    self.party = party
    self.position = position
    super.init()
  }
}
