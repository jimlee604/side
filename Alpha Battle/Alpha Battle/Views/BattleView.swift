//
//  BattleView.swift
//  Alpha Battle
//
//  Created by Jimmy Lee on 12/17/23.
//

import Foundation
import UIKit

protocol BattleViewDelegate: NSObject {
  func presentFightSequence()
}

class BattleView: UIView {
  var battleViewModel: BattleViewModel
  var myBattlePartyView: BattlePartyView
  var enemyBattlePartyView: BattlePartyView
  var fightButton: UIButton = UIButton()
  var textMessages: UILabel = UILabel()
  var delegate: BattleViewDelegate?
  var backButton: BackButton
  
  init(_ battleViewModel: BattleViewModel, presentingController: UIViewController) {
    self.battleViewModel = battleViewModel
    backButton = BackButton(controller: presentingController)
    let myBattlePartyViewModel = battleViewModel.myParty()
    myBattlePartyView = BattlePartyView(myBattlePartyViewModel)
    let enemyBattlePartyViewModel = battleViewModel.enemyParty()
    enemyBattlePartyView = BattlePartyView(enemyBattlePartyViewModel)
    super.init(frame: CGRectZero)
    self.backgroundColor = UIColor(hex: "#b4d7ffff")
    fightButton.setTitle("FIGHT", for: .normal)
    fightButton.backgroundColor = .white
    fightButton.setTitleColor(.black, for: .normal)
    fightButton.layer.cornerRadius = 10.0
    fightButton.addTarget(self, action: #selector(didTapFightButton), for: .touchUpInside)
    textMessages.numberOfLines = 0
    textMessages.textColor = .black
    textMessages.isHidden = true
    
    addSubview(myBattlePartyView)
    addSubview(enemyBattlePartyView)
    addSubview(fightButton)
    addSubview(textMessages)
    addSubview(backButton)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    backButton.frame = CGRect(origin: BackButtonOrigin, size: BackButtonSize)
    let x = 100.0
    let y1 = 25.0
    let y2 = 125.0
    let height = 50.0
    let yText = 225.0
    myBattlePartyView.frame = CGRect(x: x, y: y2, width: self.frame.width - x, height: height)
    enemyBattlePartyView.frame = CGRect(x: x, y: y1, width: self.frame.width - x, height: height)
    fightButton.frame = CGRect(x: 675, y: 150, width: 100, height: 50)
    textMessages.frame = CGRect(x: 75, y: yText, width: self.frame.width, height: self.frame.height - yText)
    textMessages.sizeToFit()
  }
  
  @objc func didTapFightButton() {
    delegate?.presentFightSequence()
  }
  
  func displayFightResults(_ fightResultsViewModel: FightResultsViewModel) {
    enemyBattlePartyView.removeFromSuperview()
    let lastIndex = fightResultsViewModel.enemyPartyUpdates.count - 1
    enemyBattlePartyView = BattlePartyView(fightResultsViewModel.enemyPartyUpdates[lastIndex])
    addSubview(enemyBattlePartyView)
    textMessages.isHidden = false
    textMessages.text = ""
    for textUpdate in fightResultsViewModel.textUpdates {
      textMessages.text! += "\(textUpdate)\n"
    }
    setNeedsLayout()
  }
}
