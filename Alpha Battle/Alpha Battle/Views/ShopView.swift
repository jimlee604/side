//
//  ShopView.swift
//  Alpha Battle
//
//  Created by Jimmy Lee on 12/9/23.
//

import Foundation
import UIKit

protocol ShopViewDelegate: NSObject {
  func buySelectedCharacter()
}

class ShopView: UIView {
  let scrollViewHeight = 400.0
  var shopViewModel: ShopViewModel
  var backButton: UIButton
  var buyButton: UIButton
  var shopScrollView: ShopScrollView
  var delegate: ShopViewDelegate?

  init(shopViewModel: ShopViewModel, presentingController: UIViewController, frame: CGRect) {
    self.shopViewModel = shopViewModel
    backButton = BackButton(controller: presentingController)
    buyButton = UIButton()
    let shopScrollViewFrame = CGRect(x: 0.0, y: 140.0, width: frame.width, height: scrollViewHeight)
    shopScrollView = ShopScrollView(shopViewModel:shopViewModel, frame: shopScrollViewFrame)
    super.init(frame: frame)
    backgroundColor = .gray
    let buttonTextAttributes = [
      NSAttributedString.Key.foregroundColor: UIColor.black,
      NSAttributedString.Key.font: UIFont(name: "MarkerFelt-Wide", size: 50.0)!
    ]
    let buttonAttributedText = NSAttributedString(string: "BUY", attributes: buttonTextAttributes)
    buyButton.setAttributedTitle(buttonAttributedText, for: .normal)
    buyButton.backgroundColor = .gray
    buyButton.layer.cornerRadius = 10
    buyButton.addTarget(self, action: #selector(didTapBuy), for: .touchUpInside)
    
    addSubview(shopScrollView)
    addSubview(backButton)
    addSubview(buyButton)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    backButton.frame = CGRect(origin: BackButtonOrigin, size: BackButtonSize)
    buyButton.frame = CGRect(x: 600.0, y: 250.0, width: 120, height: 70)
  }
  
  func refreshCharacterSelection() {
    shopScrollView.refreshCharacterSelection()
  }
  
  @objc private func didTapBuy() {
    delegate?.buySelectedCharacter()
  }
}
