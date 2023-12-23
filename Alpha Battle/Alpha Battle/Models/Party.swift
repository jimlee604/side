//
//  Party.swift
//  Alpha Battle
//
//  Created by Jimmy Lee on 12/7/23.
//

import Foundation

let maxPartySize = 4

class Party: NSObject, Codable {
  var partyMembers: [Character] = []
  
  private enum CodingKeys : String, CodingKey {
    case partyMembers
  }
  
  init(_ partyMembers: [Character] = []) {
    self.partyMembers = partyMembers
    super.init()
  }
  
  func addPartyMember(_ partyMember: Character) {
    if (partyMembers.count < maxPartySize) {
      partyMembers.append(partyMember)
    }
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(partyMembers, forKey: .partyMembers)
  }
  
  required init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    partyMembers = try container.decode([Character].self, forKey: .partyMembers)
  }
}
