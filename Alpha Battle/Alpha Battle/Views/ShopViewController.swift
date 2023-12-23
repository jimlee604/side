//
//  ShopViewController.swift
//  Alpha Battle
//
//  Created by Jimmy Lee on 12/9/23.
//

import Foundation
import UIKit

class ShopViewController: UIViewController, ShopViewDelegate {
  var shopView: ShopView?
  var shopViewModel: ShopViewModel
  
  init(shop: Shop, shopListener: ShopListener) {
    shopViewModel = ShopViewModel(shop: shop, shopListener: shopListener)
    super.init(nibName: nil, bundle: nil)
    shopView = ShopView(shopViewModel: shopViewModel,
                        presentingController: self,
                        frame: view.frame)
    shopView?.delegate = self
    navigationItem.hidesBackButton = true
    view = shopView
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(shopDidSelectCharacter(_:)),
                                           name: NSNotification.Name(rawValue: ShopNotifications.ShopDidSelectCharacterNotification),
                                           object: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc private func shopDidSelectCharacter(_ notification: NSNotification) {
    shopView!.refreshCharacterSelection()
  }
  
  func buySelectedCharacter() {
    shopViewModel.buySelectedCharacter()
    let selectedCharacterName = shopViewModel.selectedCharacterName()
    let alert = UIAlertController(title:"Bought \(selectedCharacterName)!", message:nil, preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler: nil))
    self.present(alert, animated: true, completion: nil)
  }
  
}
