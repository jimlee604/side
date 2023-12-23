//
//  TitleScreenView.swift
//  Alpha Battle
//
//  Created by Jimmy Lee on 12/7/23.
//

import Foundation
import UIKit

class TitleScreenView: UIView {
  let titleLabel: UILabel = UILabel()
  let playButton: UIButton = UIButton()

  init(presentingController: UIViewController, playAction: Selector, frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .cyan
    let titleAttributes = [NSAttributedString.Key.font: UIFont(name: "Chalkduster", size: 50.0)!]
    titleLabel.attributedText = NSAttributedString(string: "Alpha-Battle!", attributes:titleAttributes)
    
    let buttonTextAttributes = [
      NSAttributedString.Key.foregroundColor: UIColor.black,
      NSAttributedString.Key.font: UIFont(name: "MarkerFelt-Wide", size: 38.0)!
    ]
    let buttonAttributedText = NSAttributedString(string: "PLAY", attributes: buttonTextAttributes)
    playButton.backgroundColor = .white
    playButton.layer.cornerRadius = 16
    playButton.setAttributedTitle(buttonAttributedText, for: .normal)
    playButton.addTarget(presentingController, action: playAction, for: .touchUpInside)
    addSubview(titleLabel)
    addSubview(playButton)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 80.0),
      titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -100.0),
      titleLabel.widthAnchor.constraint(equalToConstant: 500.0),
      titleLabel.heightAnchor.constraint(equalToConstant: 100.0)
    ])
    
    playButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      playButton.centerXAnchor.constraint(equalTo: centerXAnchor),
      playButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 120.0),
      playButton.widthAnchor.constraint(equalToConstant: 200.0),
      playButton.heightAnchor.constraint(equalToConstant: 64.0)
    ])
  }
}
