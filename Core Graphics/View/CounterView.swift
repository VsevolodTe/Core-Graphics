//
//  CounterView.swift
//  Core Graphics
//
//  Created by Гость on 30/03/2019.
//  Copyright © 2019 Гость. All rights reserved.
//

import UIKit

@IBDesignable class CounterView: UIView {
    
    private struct Constants {
        static let numberOfGlasses = 8
        static let lineWidth = CGFloat(5)
        static let arcWidth = CGFloat(76)
        
        static var halfOfLineWidth: CGFloat {
            return lineWidth / 2
        }
    }
        
    @IBInspectable var counter: Int = 0 {
        didSet {
            if counter <= Constants.numberOfGlasses {
            setNeedsDisplay()
            }
        }
    }
        @IBInspectable var outlineColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        @IBInspectable var counterColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    
    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let radius = max(bounds.width, bounds.height) / 2
        let startAngle = 3/4 * CGFloat.pi
        let endAngle = CGFloat.pi / 4
        
        let path = UIBezierPath(arcCenter: center,
                                radius: radius - Constants.arcWidth / 2,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        path.lineWidth = Constants.arcWidth
        counterColor.setStroke()
        path.stroke()
        
        // Draw the outline
        let angleDiffirence = 2 * CGFloat.pi - startAngle + endAngle
        let arcLengPerGlass = angleDiffirence / CGFloat(Constants.numberOfGlasses)
        let outLineEndAngle = startAngle + arcLengPerGlass * CGFloat(counter)
        
        let outLinePath = UIBezierPath(arcCenter: center,
                                       radius: radius - Constants.halfOfLineWidth,
                                       startAngle: startAngle,
                                       endAngle: outLineEndAngle,
                                       clockwise: true)
        
        outLinePath.addArc(withCenter: center,
                           radius: radius - Constants.arcWidth + Constants.halfOfLineWidth,
                           startAngle: outLineEndAngle,
                           endAngle: startAngle,
                           clockwise: false)
        
        outLinePath.close()
        
        outlineColor.setStroke()
        outLinePath.lineWidth = Constants.lineWidth
        outLinePath.stroke()
        
    }
}
