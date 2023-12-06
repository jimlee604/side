//
//  LifeTrackerViewController.swift
//  LifeHack
//
//  Created by Jimmy Lee on 11/26/23.
//

import Foundation
import UIKit

class LifeTrackerViewController: UIViewController {
  var gameLifeViewModel: GameLifeViewModel
  var lifeTrackerView: LifeTrackerView?
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    let startGameState = GameLifeData(playerCount: .twoPlayer,
                                      displayPoison: false,
                                      p1LifeData: PlayerLifeData(playerLife: startingLife2P, playerPoison: startingPoison),
                                      p2LifeData: PlayerLifeData(playerLife: startingLife2P, playerPoison: startingPoison),
                                      p1Of4LifeData: PlayerLifeData(playerLife: startingLife4P, playerPoison: startingPoison),
                                      p2Of4LifeData: PlayerLifeData(playerLife: startingLife4P, playerPoison: startingPoison),
                                      p3Of4LifeData: PlayerLifeData(playerLife: startingLife4P, playerPoison: startingPoison),
                                      p4Of4LifeData: PlayerLifeData(playerLife: startingLife4P, playerPoison: startingPoison))
    self.gameLifeViewModel = GameLifeViewModel(withGame: startGameState)
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    self.lifeTrackerView = LifeTrackerView(gameLifeViewModel:self.gameLifeViewModel, frame: self.view.frame)
    self.view = self.lifeTrackerView
    
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(gameStateDidChangeNotification(_:)),
                                           name: NSNotification.Name(rawValue: GameNotifications.GameStateDidChangeNotification),
                                           object: nil)
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(didTapResetNotification(_:)),
                                           name: NSNotification.Name(rawValue: GameNotifications.GameDidTapResetNotification),
                                           object: nil)
  }
  
  deinit {
    NotificationCenter.default.removeObserver(self)
  }
  
  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @objc private func gameStateDidChangeNotification(_ notification: NSNotification) {
    self.lifeTrackerView?.gameLifeViewModel = self.gameLifeViewModel
    self.view = self.lifeTrackerView
  }

  @objc private func didTapResetNotification(_ notification: NSNotification) {
    let alert = UIAlertController(title: "Reset Game", message: "Are you sure you wish to reset the life totals?", preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "Reset", style: UIAlertAction.Style.destructive, handler: resetHandler))
    alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
    self.present(alert, animated: true, completion: nil)
  }
  
  func resetHandler(alert: UIAlertAction!) {
    self.gameLifeViewModel.resetLife()
  }
  
}
