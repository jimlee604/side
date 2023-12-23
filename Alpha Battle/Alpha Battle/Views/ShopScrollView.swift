//
//  ShopScrollView.swift
//  Alpha Battle
//
//  Created by Jimmy Lee on 12/9/23.
//

import Foundation
import UIKit

class ShopScrollView: UIView, SelectableCharacterViewDelegate {
  var shopViewModel: ShopViewModel
  var scrollView: UIScrollView
  var characterViews: [CharacterView] = [] // maybe dont need

  init(shopViewModel: ShopViewModel, frame: CGRect) {
    self.shopViewModel = shopViewModel
    characterViews = []
    scrollView = UIScrollView(frame: CGRect(origin: CGPointZero, size: frame.size))

    super.init(frame: frame)

    scrollView.contentInset = UIEdgeInsets(top: 0, left: 100, bottom: 0, right: 0)
    scrollView.backgroundColor = .orange
    refreshCharacterSelection()
    addSubview(scrollView)
  }
  
  func refreshCharacterSelection() {
    for subview in scrollView.subviews {
      subview.removeFromSuperview()
    }
    
    var x = 0.0
    for characterViewModel in shopViewModel.forSale {
      let frame = CGRectMake(x, 20.0, 50, 50)
      let characterView = SelectableCharacterView(characterViewModel: characterViewModel,
                                       frame:frame,
                                       selected: characterViewModel.selected,
                                       delegate: self)
      scrollView.addSubview(characterView)
      x += 140.0
    }
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func didSelectCharacterViewModel(_ characterViewModel: CharacterViewModel) {
    shopViewModel.selectViewModel(characterViewModel)
    return
  }
}
