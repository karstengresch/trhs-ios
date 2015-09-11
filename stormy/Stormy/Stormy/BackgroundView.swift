//
//  BackgroundView.swift
//  Stormy
//
//  Created by Karsten Gresch on 05.09.15.
//  Copyright (c) 2015 Closure One. All rights reserved.
//

import UIKit

class BackgroundView: UIView {

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
      // Background View
      
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
    }


}
