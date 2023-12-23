//
//  StageView.swift
//  Alpha Battle
//
//  Created by Jimmy Lee on 12/13/23.
//

import Foundation
import UIKit

protocol SelectableStageViewDelegate {
  func attemptSelectStage(_ stage: StageViewModel)
}

class SelectableStageView: UIView {
  var stageViewModel: StageViewModel
  var label: UILabel
  var button: UIButton
  var delegate: SelectableStageViewDelegate?
  
  init(stageViewModel: StageViewModel, delegate: SelectableStageViewDelegate?) {
    self.stageViewModel = stageViewModel
    label = UILabel(frame: CGRectZero)
    button = UIButton(frame: CGRectZero)
    self.delegate = delegate
    super.init(frame: CGRectZero)

    let titleAttributes = [NSAttributedString.Key.font: UIFont(name: "AmericanTypewriter", size: 30.0)!]
    label.attributedText = NSAttributedString(string: stageViewModel.stageName, attributes:titleAttributes)
    label.textAlignment = .center
    label.numberOfLines = 0
    
    button.addTarget(self, action: #selector(didTapStage), for: .touchUpInside)
    
    if (stageViewModel.selected) {
      layer.borderColor = UIColor.gray.cgColor
      layer.borderWidth = 4.0
    }
    
    addSubview(label)
    addSubview(button)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    label.frame = self.bounds
    button.frame =  self.bounds
  }

  @objc private func didTapStage() {
    delegate?.attemptSelectStage(stageViewModel)
  }
}
