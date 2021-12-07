//
//  RNQ42GradientManager.swift
//  RNQ42Gradient
//
//  Created by Jasper Haggenburg on 20/07/2018.
//  Copyright © 2018 Facebook. All rights reserved.
//

import Foundation
import React

@objc(RNQ42GradientManager)
class RNQ42GradientManager: RCTViewManager {
  override static func requiresMainQueueSetup() -> Bool {
    return false
  }

  override func view() -> UIView! {
    return RNQ42GradientView()
  }
}
