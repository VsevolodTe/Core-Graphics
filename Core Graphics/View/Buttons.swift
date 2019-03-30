//
//  Buttons.swift
//  Core Graphics
//
//  Created by Гость on 30/03/2019.
//  Copyright © 2019 Гость. All rights reserved.
//

import UIKit

class PlusButton: PushButton {
    override func draw(_ rect: CGRect) {
        isAddButton = true
        fillColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        super.draw(rect)
    }
}

class MinusButton: PushButton {
    override func draw(_ rect: CGRect) {
        isAddButton = false
        fillColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        super.draw(rect)
    }
}
