//
//  RNQ42GradientView.swift
//  RNQ42Gradient
//
//  Created by Jasper Haggenburg on 20/07/2018.
//  Copyright © 2018 Facebook. All rights reserved.
//


import Foundation
import React

class RNQ42GradientView: UIView {
  enum GradientType: String {
    case Linear = "linear"
    case Radial = "radial"
  }

  enum GradientViewError: LocalizedError {
    case getContext
    case initializeGradient
    case parseRadialCenter

    var errorDescription: String? {
      switch self {
      case .getContext:
        return "could not get UIGraphicsGetCurrentContext"
      case .initializeGradient:
        return "could not initialize CGGradient"
      case .parseRadialCenter:
        return "could not parse radialCenter"
      }
    }
  }

  private var type: GradientType?
  private var colors: CFArray?
  private var locations: [CGFloat]?
  private var radialCenter: CGPoint?
  private var radialRadius: CGFloat?

  init() {
    super.init(frame: .zero)
    backgroundColor = .clear
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  @objc(setType:)
  func set(type: NSString) {
    self.type = GradientType(rawValue: type as String)
    self.setNeedsDisplay()
  }

  @objc(setColors:)
  func set(colors: [UIColor]) {
    self.colors = colors.map { $0.cgColor } as CFArray
    self.setNeedsDisplay()
  }

  @objc(setLocations:)
  func set(locations: [NSNumber]) {
    self.locations = locations.map { CGFloat(truncating: $0) }
    self.setNeedsDisplay()
  }

  @objc(setRadialCenter:)
  func set(radialCenter: [NSNumber]) {
    if let x = radialCenter[0] as? CGFloat, let y = radialCenter[1] as? CGFloat {
      self.radialCenter = CGPoint(x: x, y: y)
      self.setNeedsDisplay()
    } else {
      log(error: .parseRadialCenter)
    }
  }

  @objc(setRadialRadius:)
  func set(radialRadius: NSNumber) {
    self.radialRadius = CGFloat(truncating: radialRadius)
    self.setNeedsDisplay()
  }

  override func draw(_ rect: CGRect) {
    guard
      let type = self.type,
      let colors = self.colors,
      let locations = self.locations
      else { return }

    guard let context = UIGraphicsGetCurrentContext() else {
      log(error: .getContext)
      return
    }

    guard let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: colors, locations: locations) else {
      log(error: .initializeGradient)
      return
    }

    switch type {
    case .Linear:
      drawLinearGradient(context: context, gradient: gradient)
    case .Radial:
      drawRadialGradient(context: context, gradient: gradient)
    }
  }

  private func drawLinearGradient(context: CGContext, gradient: CGGradient) {
    let start = CGPoint.zero
    let end = CGPoint(x: 0, y: bounds.height)
    context.drawLinearGradient(gradient, start: start, end: end, options: [])
  }

  private func drawRadialGradient(context: CGContext, gradient: CGGradient) {
    guard
      let c = self.radialCenter,
      let r = self.radialRadius
      else { return }

    let radialCenter = CGPoint(x: bounds.width * c.x, y: bounds.height * c.y)
    context.drawRadialGradient(gradient, startCenter: radialCenter, startRadius: 0.0, endCenter: radialCenter, endRadius: r, options: [])
  }

  private func log(error: GradientViewError) {
    // don't crash in production, but report it in development
    if RCT_DEBUG == 1 {
      RCTFatal(error)
    }
  }
}

