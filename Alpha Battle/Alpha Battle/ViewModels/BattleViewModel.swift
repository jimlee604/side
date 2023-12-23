//
//  BattleViewModel.swift
//  Alpha Battle
//
//  Created by Jimmy Lee on 12/17/23.
//

import Foundation

class BattleViewModel: NSObject {
  var battle: Battle
  
  init(battle: Battle) {
    self.battle = battle
  }
  
  func myParty() -> BattlePartyViewModel {
    return BattlePartyViewModel(battle.myParty, position: .mine)
  }
  
  func enemyParty() -> BattlePartyViewModel {
    return BattlePartyViewModel(battle.enemyParty, position: .enemy)
  }
  
  func getFightResults() -> FightResultsViewModel {
    var textUpdates: [String] = []
    var enemyPartyUpdates: [Party] = []

    for character in battle.myParty.partyMembers {
      let enemyPartyCopy = battle.enemyParty
      let targetEnemy = getTarget(party: enemyPartyCopy)
      if (targetEnemy == nil) {
        textUpdates.append("Defeated enemy party!")
        enemyPartyUpdates.append(enemyPartyUpdates.count > 0 ? enemyPartyUpdates[enemyPartyUpdates.count - 1] : battle.enemyParty)
        let fightResults = FightResults(textUpdates: textUpdates, myPartyUpdates: [], enemyPartyUpdates: enemyPartyUpdates)
        return FightResultsViewModel(fightResults)
      }
      let confirmedEnemy = targetEnemy!
      let damage = min(confirmedEnemy.hp, character.atk)
      textUpdates.append("Ally \(character.name) attacks enemy \(confirmedEnemy.name) for \(damage) damage.")
      confirmedEnemy.hp -= damage
      enemyPartyUpdates.append(enemyPartyCopy)
    }
    let fightResults = FightResults(textUpdates: textUpdates, myPartyUpdates: [], enemyPartyUpdates: enemyPartyUpdates)
    return FightResultsViewModel(fightResults)
  }
  
  private func getTarget(party: Party) -> Character? {
    for character in party.partyMembers {
      if (character.hp > 0) {
        return character
      }
    }
    return nil
  }
  
  func resetHp() {
    for character in battle.myParty.partyMembers {
      character.hp = character.maxHp
    }
    for character in battle.enemyParty.partyMembers {
      character.hp = character.maxHp
    }
  }
}
