//
//  BackButton.swift
//  Alpha Battle
//
//  Created by Jimmy Lee on 12/8/23.
//

import Foundation
import UIKit

let BackButtonWidth = 50.0
let BackButtonSize = CGSize(width: BackButtonWidth, height: BackButtonWidth)
let BackButtonOrigin = CGPoint(x: 60, y: 40)

class BackButton: UIButton {
  let controller: UIViewController
  
  init(controller: UIViewController) {
    self.controller = controller
    let backButtonFrame = CGRect(origin: CGPointZero, size: BackButtonSize)
    super.init(frame: backButtonFrame)
    layer.cornerRadius = BackButtonWidth / 2.0
    backgroundColor = .white
    let buttonTextAttributes = [
      NSAttributedString.Key.foregroundColor: UIColor.black,
      NSAttributedString.Key.font: UIFont(name: "MarkerFelt-Wide", size: 50.0)!
    ]
    let buttonAttributedText = NSAttributedString(string: "<", attributes: buttonTextAttributes)
    setAttributedTitle(buttonAttributedText, for: .normal)
    addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 14, right: 4)
  }
  
  @objc func didTapBackButton() {
    // prevent double tap scenario?
    controller.navigationController?.popViewController(animated: false)
  }
}
