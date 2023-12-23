//
//  MainMenuView.swift
//  Alpha Battle
//
//  Created by Jimmy Lee on 12/7/23.
//

import Foundation
import UIKit

protocol MainMenuPresenter: UIViewController {
  func handleBattleAction()
  func handlePartyAction()
  func handleShopAction()
  func handleSaveAction()
}

class MainMenuView: UIView {
  let battleButton = UIButton()
  let partyButton = UIButton()
  let shopButton = UIButton()
  let saveButton = UIButton()
  var presenter: MainMenuPresenter

  let buttonWidth = 200.0
  let buttonHeight = 80.0
  
  init(presenter: MainMenuPresenter,
       frame: CGRect) {
    self.presenter = presenter
    super.init(frame: frame)
    backgroundColor = UIColor(red: 66/255.0, green: 245/255.0, blue: 170/255.0, alpha: 1.0)
    
    let menuButtonTextAttributes: [NSAttributedString.Key : Any] = [ NSAttributedString.Key.font : UIFont(name: "ChalkboardSE-Bold", size:40.0)! ]
    let fightButtonTitle = NSAttributedString(string: "BATTLE", attributes: menuButtonTextAttributes)
    battleButton.setAttributedTitle(fightButtonTitle, for: .normal)
    applyUISettingsForButton(battleButton)
    battleButton.addTarget(self, action: #selector(didTapBattle), for: .touchUpInside)
    let partyButtonTitle = NSAttributedString(string: "PARTY", attributes: menuButtonTextAttributes)
    partyButton.setAttributedTitle(partyButtonTitle, for: .normal)
    applyUISettingsForButton(partyButton)
    partyButton.addTarget(self, action: #selector(didTapParty), for: .touchUpInside)
    let shopButtonTitle = NSAttributedString(string: "SHOP", attributes: menuButtonTextAttributes)
    shopButton.setAttributedTitle(shopButtonTitle, for: .normal)
    applyUISettingsForButton(shopButton)
    shopButton.addTarget(self, action: #selector(didTapShop), for: .touchUpInside)
    let saveButtonTitle = NSAttributedString(string: "SAVE", attributes: menuButtonTextAttributes)
    saveButton.setAttributedTitle(saveButtonTitle, for: .normal)
    applyUISettingsForButton(saveButton)
    saveButton.addTarget(self, action: #selector(didTapSave), for: .touchUpInside)
    addSubview(battleButton)
    addSubview(partyButton)
    addSubview(shopButton)
    addSubview(saveButton)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    let xInset = 180.0
    let yInset = 90.0
    
    battleButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      battleButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -xInset),
      battleButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -yInset),
      battleButton.widthAnchor.constraint(equalToConstant: buttonWidth),
      battleButton.heightAnchor.constraint(equalToConstant: buttonHeight)
    ])
    
    partyButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      partyButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: xInset),
      partyButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -yInset),
      partyButton.widthAnchor.constraint(equalToConstant: buttonWidth),
      partyButton.heightAnchor.constraint(equalToConstant: buttonHeight)
    ])
    
    shopButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      shopButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -xInset),
      shopButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: yInset),
      shopButton.widthAnchor.constraint(equalToConstant: buttonWidth),
      shopButton.heightAnchor.constraint(equalToConstant: buttonHeight)
    ])
    
    saveButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      saveButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: xInset),
      saveButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: yInset),
      saveButton.widthAnchor.constraint(equalToConstant: buttonWidth),
      saveButton.heightAnchor.constraint(equalToConstant: buttonHeight)
    ])
  }
  
  private func applyUISettingsForButton(_ button: UIButton) {
    button.backgroundColor = .white
    button.layer.cornerRadius = buttonHeight / 4.0
  }
  
  @objc private func didTapBattle() {
    presenter.handleBattleAction()
  }
  
  @objc private func didTapParty() {
    presenter.handlePartyAction()
  }
  
  @objc private func didTapShop() {
    presenter.handleShopAction()
  }
  
  @objc private func didTapSave() {
    presenter.handleSaveAction()
  }
  
}
