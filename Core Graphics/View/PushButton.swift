//
//  PushButton.swift
//  Core Graphics
//
//  Created by Гость on 23/03/2019.
//  Copyright © 2019 Гость. All rights reserved.
//

import UIKit

@IBDesignable class PushButton: UIButton {
    
    @IBInspectable var fillColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
    @IBInspectable var isAddButton = true
    
    private struct Constants {
        static let plusLineWidth: CGFloat = 3
        static let plusButtonScale: CGFloat = 0.6
    }
    private var halfWidth: CGFloat {
    return bounds.width / 2
    }
    
    private var halfHeight: CGFloat {
        return bounds.height / 2
    }
    
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        fillColor.setFill()
        path.fill()
        
        // Horizontal Line
        let plusWidth = min(bounds.width, bounds.height) * Constants.plusButtonScale
        let halfPlusWidth = plusWidth / 2
        
        let plusPath = UIBezierPath()
        plusPath.lineWidth = Constants.plusLineWidth
        plusPath.move(to: CGPoint(x: halfWidth - halfPlusWidth, y: halfHeight))
        plusPath.addLine(to: CGPoint(x: halfWidth + halfPlusWidth, y: halfHeight))
        
        // Vertical Line
        if isAddButton {
        plusPath.move(to: CGPoint(x: halfWidth, y: halfHeight - halfPlusWidth))
        plusPath.addLine(to: CGPoint(x: halfWidth, y: halfHeight +  halfPlusWidth))
        }
        
        // Paint with white color
        UIColor.white.setStroke()
        plusPath.stroke()
        
    }
    
}
