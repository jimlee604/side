//
//  PartyViewController.swift
//  Alpha Battle
//
//  Created by Jimmy Lee on 12/8/23.
//

import Foundation
import UIKit

class PartyViewController: UIViewController {
  
  init(party:Party) {
    super.init(nibName: nil, bundle: nil)
    navigationItem.hidesBackButton = true
    view = PartyView(partyViewModel: PartyViewModel(party: party),
                     presentingController: self,
                     frame: view.frame)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
