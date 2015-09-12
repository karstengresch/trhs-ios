//
//  DetailBackgroundView.swift
//  Stormy
//
//  Created by Karsten Gresch on 11.09.15.
//  Copyright (c) 2015 Closure One. All rights reserved.
//

import UIKit

class DetailBackgroundView: UIView {
  
  override func drawRect(rect: CGRect) {
    //// Color Declarations
    let lightBlue: UIColor = UIColor(hue:0.619, saturation:1, brightness:0.978, alpha:0.4)
    let darkBlue: UIColor = UIColor(hue:0.6, saturation:0.86, brightness:0.548, alpha:1)
    
    let context = UIGraphicsGetCurrentContext()
    
    //// Gradient Declarations
    let blueGradient = CGGradientCreateWithColors(CGColorSpaceCreateDeviceRGB(), [lightBlue.CGColor, darkBlue.CGColor], [0, 1])
    
    //// Background Drawing
    let backgroundPath = UIBezierPath(rect: CGRectMake(0, 0, self.frame.width, self.frame.height))
    CGContextSaveGState(context)
    backgroundPath.addClip()
    CGContextDrawLinearGradient(context, blueGradient,
      CGPointMake(160, 0),
      CGPointMake(160, 568),
      UInt32(kCGGradientDrawsBeforeStartLocation) | UInt32(kCGGradientDrawsAfterEndLocation))
    CGContextRestoreGState(context)
    
    //// Sun Path
    
    let circleOrigin = CGPointMake(0, 0.75 * self.frame.height)
    let circleSize = CGSizeMake(self.frame.width, 0.55 * self.frame.height)
    
    let pathStrokeColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 0.390)
    let pathFillColor = UIColor(red: 1.000, green: 1.000, blue: 1.000, alpha: 0.100)
    
    
    //// Sun Drawing
    var sunPath = UIBezierPath(ovalInRect: CGRectMake(circleOrigin.x, circleOrigin.y, circleSize.width, circleSize.height))
    pathFillColor.setFill()
    sunPath.fill()
    pathStrokeColor.setStroke()
    sunPath.lineWidth = 1
    CGContextSaveGState(context)
    CGContextSetLineDash(context, 0, [2, 2], 2)
    sunPath.stroke()
    CGContextRestoreGState(context)
  }

}
