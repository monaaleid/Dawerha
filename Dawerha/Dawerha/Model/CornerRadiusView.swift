//
//  CornerRadiusView.swift
//  Dawerha
//
//  Created by mona aleid on 10/06/1443 AH.
//

import Foundation
import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
    get { return self.cornerRadius }
    set {
      self.layer.cornerRadius = newValue
    }
  }
}
