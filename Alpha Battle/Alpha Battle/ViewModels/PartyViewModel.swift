//
//  PartyViewModel.swift
//  Alpha Battle
//
//  Created by Jimmy Lee on 12/8/23.
//

import Foundation

class PartyViewModel : NSObject {
  let party: Party
  var characterViewModels: [ CharacterViewModel ] {
    get {
      var result: [ CharacterViewModel ] = []
      for character in party.partyMembers {
        result.append(CharacterViewModel(character))
      }
      return result
    }
  }
  
  init(party: Party) {
    self.party = party
  }
  
}
