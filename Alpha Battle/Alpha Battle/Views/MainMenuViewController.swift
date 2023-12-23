//
//  MainMenuViewController.swift
//  Alpha Battle
//
//  Created by Jimmy Lee on 12/7/23.
//

import Foundation
import UIKit

class MainMenuViewController: UIViewController, MainMenuPresenter {
  let gameModel: Game
  
  init(gameModel: Game) {
    self.gameModel = gameModel
    super.init(nibName: nil, bundle: nil)
    navigationItem.hidesBackButton = true
    view = MainMenuView(presenter: self, frame: view.frame)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func handlePartyAction() {
    let partyVC = PartyViewController(party: gameModel.party)
    partyVC.modalPresentationStyle = .fullScreen
    navigationController?.pushViewController(partyVC, animated: false)
  }
  
  func handleShopAction() {
    let shopVC = ShopViewController(shop: gameModel.shop, shopListener:gameModel)
    shopVC.modalPresentationStyle = .fullScreen
    navigationController?.pushViewController(shopVC, animated: false)
  }
 
  func handleBattleAction() {
    let fightMapVC = BattleMapViewController(battleMap: gameModel.battleMap)
    fightMapVC.modalPresentationStyle = .fullScreen
    navigationController?.pushViewController(fightMapVC, animated: false)
  }
  
  func handleSaveAction() {
    // run save process
    let encoder = JSONEncoder()
    let encoded = try? encoder.encode(gameModel)
    let defaults = UserDefaults.standard
    defaults.set(encoded, forKey: "gameData") // move to constant
    
    let alert = UIAlertController(title:"Saved!", message:nil, preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler: nil))
    self.present(alert, animated: true, completion: nil)
  }
  
}
