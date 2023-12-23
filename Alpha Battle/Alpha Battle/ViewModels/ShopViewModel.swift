//
//  ShopViewModel.swift
//  Alpha Battle
//
//  Created by Jimmy Lee on 12/9/23.
//

import Foundation

enum ShopNotifications {
  static let ShopDidSelectCharacterNotification = "ShopDidSelectCharacterNotification"
}

protocol ShopListener {
  func buyCharacter(character: Character)
}

class ShopViewModel: NSObject {
  private var shop: Shop
  private var shopListener: ShopListener
  var forSale: [CharacterViewModel] {
    get {
      var viewModels: [CharacterViewModel] = []
      for character in shop.forSale {
        viewModels.append(CharacterViewModel(character))
      }
      return viewModels
    }
  }
  
  init(shop: Shop, shopListener: ShopListener) {
    self.shop = shop
    self.shopListener = shopListener
  }

  func selectViewModel(_ selectedViewModel: CharacterViewModel) {
    for characterViewModel in forSale {
      characterViewModel.selectModel(false)
    }
    selectedViewModel.selectModel(true)
    NotificationCenter.default.post(name: Notification.Name(rawValue: ShopNotifications.ShopDidSelectCharacterNotification), object: self)
  }
  
  func selectedCharacterName() -> String {
    return shop.selectedCharacter()?.name ?? ""
  }
  func buySelectedCharacter() {
    shopListener.buyCharacter(character: shop.selectedCharacter()!)
  }
  
}
