//
//  TitleView.swift
//  LifeHack
//
//  Created by Jimmy Lee on 11/23/23.
//

import Foundation
import UIKit

class TitleView: UIView {
  var titleLabel: UILabel
  var startButton: UIButton
  
  init(frame: CGRect, 
       presentLifeTrackerAction: Selector,
       presentingController: UIViewController) {
    self.titleLabel = UILabel()
    self.startButton = UIButton()
    super.init(frame: frame)

    self.backgroundColor = .systemCyan
    let titleAttributes = [NSAttributedString.Key.font: UIFont(name: "Chalkduster", size: 50.0)!]
    self.titleLabel.attributedText = NSAttributedString(string: "LifeHack", attributes:titleAttributes)
    self.titleLabel.textAlignment = .center

    let buttonTextAttributes = [
      NSAttributedString.Key.foregroundColor: UIColor.black,
      NSAttributedString.Key.font: UIFont(name: "MarkerFelt-Wide", size: 38.0)!
    ]
    let buttonAttributedText = NSAttributedString(string: "START", attributes: buttonTextAttributes)
    self.startButton.setAttributedTitle(buttonAttributedText, for: .normal)
    self.startButton.backgroundColor = .white
    self.startButton.layer.cornerRadius = 12
    self.startButton.addTarget(presentingController, action: presentLifeTrackerAction, for: .touchUpInside)

    self.addSubview(titleLabel)
    self.addSubview(startButton)
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      self.titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 200),
      self.titleLabel.heightAnchor.constraint(equalToConstant: 80),
      self.titleLabel.widthAnchor.constraint(equalToConstant: self.frame.width)
    ])

    self.startButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      self.startButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      self.startButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -300),
      self.startButton.heightAnchor.constraint(equalToConstant: 60),
      self.startButton.widthAnchor.constraint(equalToConstant: 160)
    ])
  }
}
