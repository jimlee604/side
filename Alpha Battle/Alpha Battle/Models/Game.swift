//
//  GameModel.swift
//  Alpha Battle
//
//  Created by Jimmy Lee on 12/8/23.
//

import Foundation

class Game: NSObject, Codable, ShopListener {
  var battleMap: BattleMap
  var party: Party
  var shop: Shop
  
  private enum CodingKeys : String, CodingKey {
    case fightMap, party, shop
  }
  
  init(fightMap: BattleMap, party: Party, shop: Shop) {
    self.battleMap = fightMap
    self.party = party
    self.shop = shop
  }
  
  func buyCharacter(character: Character) {
    party.addPartyMember(character)
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(battleMap, forKey: .fightMap)
    try container.encode(party, forKey: .party)
    try container.encode(shop, forKey: .shop)
  }
  
  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    battleMap = try container.decode(BattleMap.self, forKey: .fightMap)
    party = try container.decode(Party.self, forKey: .party)
    shop = try container.decode(Shop.self, forKey: .shop)
  }
}
