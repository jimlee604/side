//
//  Shop.swift
//  Alpha Battle
//
//  Created by Jimmy Lee on 12/9/23.
//

import Foundation

class Shop: NSObject, Codable {
  var forSale: [ Character ]
  
  private enum CodingKeys : String, CodingKey {
    case forSale
  }
  
  override init() {
    forSale = [Character.GenerateRedBeta(), Character.GenerateBlueGamma(), Character.GenerateGreenDelta()]
    forSale.first?.selected = true
    super.init()
  }
  
  func selectedCharacter() -> Character? {
    for character in forSale {
      if (character.selected) {
        return character
      }
    }
    return nil
  }

  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(forSale, forKey: .forSale)
  }
  
  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    forSale = try container.decode([Character].self, forKey: .forSale)
  }
  
}
