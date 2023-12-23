//
//  CharacterViewModel.swift
//  Alpha Battle
//
//  Created by Jimmy Lee on 12/8/23.
//

import Foundation

class CharacterViewModel : NSObject {
  private var character: Character
  let name: String
  let colorHex: String
  var selected: Bool {
    get {
      return character.selected
    }
  }
  
  init(_ character: Character) {
    self.character = character
    self.name = character.name
    self.colorHex = character.colorHex
    super.init()
  }
  
  func selectModel(_ selected: Bool) {
    character.selected = selected
    return
  }
  
  func getCurrentHp() -> Int {
    return character.hp
  }
}
