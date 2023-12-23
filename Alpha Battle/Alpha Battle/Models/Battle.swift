//
//  Battle.swift
//  Alpha Battle
//
//  Created by Jimmy Lee on 12/17/23.
//

import Foundation

class Battle: NSObject {
  var myParty: Party
  var enemyParty: Party
  
  init(myParty: Party, enemyParty: Party) {
    self.myParty = myParty
    self.enemyParty = enemyParty
  }
}
