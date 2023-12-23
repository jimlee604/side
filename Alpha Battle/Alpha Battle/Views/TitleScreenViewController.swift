//
//  ViewController.swift
//  Alpha Battle
//
//  Created by Jimmy Lee on 12/7/23.
//

import UIKit

class TitleScreenViewController: UIViewController {

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    view = TitleScreenView(presentingController: self, playAction: #selector(didTapPlay), frame:view.frame)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @objc private func didTapPlay() {
    let party = Party()
    party.addPartyMember(Character.generateWhiteAlpha())
    let defaults = UserDefaults.standard
    let encoded = defaults.value(forKey: "gameData") // make gameData a constant
    let gameModel: Game
    if (encoded != nil) {
      let decoder = JSONDecoder()
      let decoded: Game = try! decoder.decode(Game.self, from: encoded as! Data)
      gameModel = decoded
    } else {
      gameModel = Game(fightMap:BattleMap.FightMapInitialSetUp(myParty: party), party: party, shop: Shop()) // do initial setup for all
    }
    let mainMenuVC = MainMenuViewController(gameModel: gameModel)
    navigationController?.pushViewController(mainMenuVC, animated: false)
  }

}

