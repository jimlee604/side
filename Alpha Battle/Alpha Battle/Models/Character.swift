//
//  Character.swift
//  Alpha Battle
//
//  Created by Jimmy Lee on 12/7/23.
//

import Foundation

class Character: Codable {
  let name: String
  let colorHex: String
  var hp: Int
  let maxHp: Int
  let atk: Int
  var selected: Bool
  
  private enum CodingKeys : String, CodingKey {
    case name, colorHex, hp, maxHp, atk, selected
  }
  
  init(name: String, colorHex: String, maxHp: Int, atk: Int, selected: Bool) {
    self.name = name
    self.colorHex = colorHex
    self.maxHp = maxHp
    self.hp = maxHp
    self.atk = atk
    self.selected = selected
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(name, forKey: .name)
    try container.encode(colorHex, forKey: .colorHex)
    try container.encode(hp, forKey: .hp)
    try container.encode(maxHp, forKey: .maxHp)
    try container.encode(atk, forKey: .atk)
    try container.encode(selected, forKey: .selected)
  }
  
  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    name = try container.decode(String.self, forKey: .name)
    colorHex = try container.decode(String.self, forKey: .colorHex)
    hp = try container.decode(Int.self, forKey: .hp)
    maxHp = try container.decode(Int.self, forKey: .maxHp)
    atk = try container.decode(Int.self, forKey: .atk)
    selected = try container.decode(Bool.self, forKey: .selected)
  }

  static func generateWhiteAlpha() -> Character {
    return Character(name: "α", colorHex: "#ffffffff", maxHp: 10, atk: 4, selected: false)
  }
  
  static func GenerateRedBeta() -> Character {
    return Character(name: "β", colorHex: "#ff0000ff", maxHp: 7, atk: 1, selected: false)
  }
  
  static func GenerateBlueGamma() -> Character {
    return Character(name: "γ", colorHex: "#0091e4ff", maxHp: 8, atk: 2, selected: false)
  }
  
  static func GenerateGreenDelta() -> Character {
    return Character(name: "δ", colorHex: "#11f3afff", maxHp: 9, atk: 3, selected: false)
  }
  
}
