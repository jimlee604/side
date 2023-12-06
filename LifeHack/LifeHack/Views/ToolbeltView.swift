//
//  ToolbeltView.swift
//  LifeHack
//
//  Created by Jimmy Lee on 11/27/23.
//

import Foundation
import UIKit

class ToolbeltView: UIView {
  var gameLifeViewModel: GameLifeViewModel
  var multiplayerButton: UIButton
  var poisonButton: UIButton
  var resetButton: UIButton

  init(gameLifeViewModel: GameLifeViewModel) {
    self.gameLifeViewModel = gameLifeViewModel
    self.multiplayerButton = UIButton()
    self.poisonButton = UIButton()
    self.resetButton = UIButton()

    super.init(frame: CGRectZero)
    
    self.backgroundColor = .black
    
    self.addSubview(self.multiplayerButton)
    self.addSubview(self.poisonButton)
    self.addSubview(self.resetButton)
    
    self.multiplayerButton.titleLabel?.font = UIFont(name: "ArialRoundedMTBold", size: 30)
    self.multiplayerButton.setTitle(multiplayerButtonTitle(), for: .normal)
    self.multiplayerButton.backgroundColor = .white
    self.multiplayerButton.setTitleColor(.black, for: .normal)
    self.multiplayerButton.layer.cornerRadius = 30.0 // move button size const out
    self.multiplayerButton.addTarget(self, action: #selector(didTapTogglePlayerCount), for: .touchUpInside)
    
    self.poisonButton.titleLabel?.font = UIFont(name: "ArialRoundedMTBold", size: 40)
    self.poisonButton.setTitle("Φ", for: .normal)
    self.poisonButton.backgroundColor = .white
    self.poisonButton.setTitleColor(.black, for: .normal)
    self.poisonButton.layer.cornerRadius = 30.0 // move button size const out
    self.poisonButton.addTarget(self, action: #selector(didTapTogglePoison), for: .touchUpInside)
    
    self.resetButton.setImage(.resetIcon, for: .normal)
    self.resetButton.addTarget(self, action: #selector(notifyDidTapResetButton), for: .touchUpInside)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func multiplayerButtonTitle() -> String {
    switch self.gameLifeViewModel.playerCount {
    case .twoPlayer:
        return "4P"
    case .fourPlayer:
      return "2P"
    }
  }
  
  func updatePlayerCountButton() {
      self.multiplayerButton.setTitle(multiplayerButtonTitle(), for: .normal)
  }

  override func layoutSubviews() {
    let buttonSize = 60.0
    let padding = 40.0
    self.multiplayerButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      self.multiplayerButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
      self.multiplayerButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: padding),
      self.multiplayerButton.heightAnchor.constraint(equalToConstant: buttonSize),
      self.multiplayerButton.widthAnchor.constraint(equalToConstant: buttonSize)
    ])
    
    self.poisonButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      self.poisonButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
      self.poisonButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      self.poisonButton.heightAnchor.constraint(equalToConstant: buttonSize),
      self.poisonButton.widthAnchor.constraint(equalToConstant: buttonSize)
    ])
    
    self.resetButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      self.resetButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
      self.resetButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -padding),
      self.resetButton.heightAnchor.constraint(equalToConstant: buttonSize),
      self.resetButton.widthAnchor.constraint(equalToConstant: buttonSize)
    ])
  }
  
  @objc func didTapTogglePlayerCount() {
    self.gameLifeViewModel.togglePlayerCount()
  }
  
  @objc func didTapTogglePoison() {
      self.gameLifeViewModel.togglePoison()
  }
  
  @objc func notifyDidTapResetButton() {
    NotificationCenter.default.post(name: Notification.Name(rawValue: GameNotifications.GameDidTapResetNotification), object: self)
  }
  
}
