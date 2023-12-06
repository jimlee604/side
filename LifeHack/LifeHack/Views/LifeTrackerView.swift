//
//  LifeTrackerView.swift
//  LifeHack
//
//  Created by Jimmy Lee on 11/26/23.
//

import Foundation
import UIKit

var toolbeltHeight = 100.0
var dividerWidth = 8.0

class LifeTrackerView: UIView {
  private var _gameLifeViewModel: GameLifeViewModel
  var gameLifeViewModel: GameLifeViewModel {
    get {
      return _gameLifeViewModel
    }
    set {
      _gameLifeViewModel = newValue
      setUpWithModel(gameLifeViewModel: newValue)
    }
  }
  var p1LifeView: PlayerFullLifeView?
  var p2LifeView: PlayerFullLifeView? // without ?
  var p3LifeView: PlayerFullLifeView?
  var p4LifeView: PlayerFullLifeView?
  var toolbeltView: ToolbeltView
  
  init(gameLifeViewModel: GameLifeViewModel,
       frame: CGRect) {
    _gameLifeViewModel = gameLifeViewModel
    self.toolbeltView = ToolbeltView(gameLifeViewModel: gameLifeViewModel)
    
    super.init(frame: frame)
    
    self.backgroundColor = .black
    setUpWithModel(gameLifeViewModel: gameLifeViewModel)
  }
  
  private func setUpWithModel(gameLifeViewModel: GameLifeViewModel) {
    _gameLifeViewModel = gameLifeViewModel
    for subview in self.subviews {
      subview.removeFromSuperview()
    }
    switch gameLifeViewModel.playerCount {
    case .twoPlayer:
      self.p1LifeView = PlayerFullLifeView(playerLifeViewModel: gameLifeViewModel.player1,
                                           transform: CGAffineTransformIdentity,
                                           isFlipped: false,
                                           frame: cellFrameFor2P())
      self.p2LifeView = PlayerFullLifeView(playerLifeViewModel: gameLifeViewModel.player2,
                                           transform: CGAffineTransform(rotationAngle: CGFloat.pi),
                                           isFlipped: true,
                                           frame: cellFrameFor2P())
      self.addSubview(self.p1LifeView!)
      self.addSubview(self.p2LifeView!)
    case .fourPlayer:
      self.p1LifeView = PlayerFullLifeView(playerLifeViewModel: gameLifeViewModel.player1Of4,
                                           transform: CGAffineTransform(rotationAngle: 0.5 * .pi),
                                           isFlipped: false,
                                           frame: cellFrameFor4P())
      self.p2LifeView = PlayerFullLifeView(playerLifeViewModel: gameLifeViewModel.player2Of4,
                                           transform: CGAffineTransform(rotationAngle: 0.5 * .pi),
                                           isFlipped: false,
                                           frame: cellFrameFor4P())
      self.p3LifeView = PlayerFullLifeView(playerLifeViewModel: gameLifeViewModel.player3Of4,
                                           transform: CGAffineTransform(rotationAngle: 1.5 * .pi),
                                           isFlipped: true,
                                           frame: cellFrameFor4P())
      self.p4LifeView = PlayerFullLifeView(playerLifeViewModel: gameLifeViewModel.player4Of4,
                                           transform: CGAffineTransform(rotationAngle: 1.5 * .pi),
                                           isFlipped: true,
                                           frame: cellFrameFor4P())
      self.addSubview(self.p1LifeView!)
      self.addSubview(self.p2LifeView!)
      self.addSubview(self.p3LifeView!)
      self.addSubview(self.p4LifeView!)
    }
    self.toolbeltView.updatePlayerCountButton()
    self.addSubview(self.toolbeltView)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    switch gameLifeViewModel.playerCount {
    case .twoPlayer:
      p3LifeView?.isHidden = true
      p4LifeView?.isHidden = true
      layoutSubviewsFor2P()
    case .fourPlayer:
      p3LifeView?.isHidden = false
      p4LifeView?.isHidden = false
      layoutSubviewsFor4P()
    }
    
    toolbeltView.frame = CGRect(x: 0, y: 0.5 * (self.frame.height - toolbeltHeight), width: self.frame.width, height: toolbeltHeight)
  }
  
  func layoutSubviewsFor2P() {
    let frame = cellFrameFor2P()
    let quadrantY = (self.frame.height + toolbeltHeight) / 2.0

    p1LifeView?.frame = CGRectMake(0, quadrantY, frame.width, frame.height)
    p2LifeView?.frame = CGRectMake(0, 0, frame.width, frame.height)
  }
  
  func layoutSubviewsFor4P() {
    let frame = cellFrameFor4P()
    let quadrantX = (self.frame.width + dividerWidth) / 2.0
    let quadrantY = (self.frame.height + toolbeltHeight) / 2.0
    
    p1LifeView?.frame = CGRectMake(0, 0, frame.width, frame.height)
    p2LifeView?.frame = CGRectMake(0, quadrantY, frame.width, frame.height)
    p3LifeView?.frame = CGRectMake(quadrantX, 0, frame.width, frame.height)
    p4LifeView?.frame = CGRectMake(quadrantX, quadrantY, frame.width, frame.height)
  }
  
  func cellFrameFor2P() -> CGRect {
    let cellHeight = (self.frame.height - toolbeltHeight) / 2.0
    return CGRectMake(0, 0, self.frame.width, cellHeight)
  }
  
  func cellFrameFor4P() -> CGRect {
    let cellHeight = (self.frame.height - toolbeltHeight) / 2.0
    let cellWidth = (self.frame.width - dividerWidth) / 2.0
    return CGRectMake(0, 0, cellWidth, cellHeight)
  }
}
