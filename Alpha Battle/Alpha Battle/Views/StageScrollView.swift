//
//  StageGroupView.swift
//  Alpha Battle
//
//  Created by Jimmy Lee on 12/13/23.
//

import Foundation
import UIKit

class StageScrollView: UIView {
  var stageViewModels: [StageViewModel]
  var scrollView: UIScrollView
  var delegate: SelectableStageViewDelegate?
  
  init(stageViewModels: [StageViewModel]) {
    self.stageViewModels = stageViewModels
    scrollView = UIScrollView()
    super.init(frame: CGRectZero)
    addSubview(scrollView)
    refreshScrollView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    scrollView.frame = bounds
    var x = 0.0
    let stageWidth = 200.0
    let stageHeight = 100.0
    let buffer = 10.0
    for subview in scrollView.subviews {
      subview.frame = CGRect(x: x, y: 0, width: stageWidth, height: stageHeight)
      subview.setNeedsLayout()
      x += stageWidth + buffer
    }
  }
  
  func setDelegate(_ delegate: SelectableStageViewDelegate) {
    self.delegate = delegate
    refreshScrollView()
  }
  
  func refreshScrollView() {
    for subview in scrollView.subviews {
      subview.removeFromSuperview()
    }
    for stageViewModel in stageViewModels {
      scrollView.addSubview(SelectableStageView(stageViewModel: stageViewModel, delegate: delegate))
      setNeedsLayout()
    }
  }
}
