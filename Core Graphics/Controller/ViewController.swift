//
//  ViewController.swift
//  Core Graphics
//
//  Created by Гость on 23/03/2019.
//  Copyright © 2019 Гость. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var counterLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = String(counterView.counter)
    }
    
    @IBAction func pushButtonPressed(_ button: PushButton) {
        if button.isAddButton {
            counterView.counter += 1
        } else {
            if 0 < counterView.counter {
                counterView.counter -= 1
            }
        }
        counterLabel.text = String(counterView.counter)
    }

}

