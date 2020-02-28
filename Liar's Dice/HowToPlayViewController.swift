//
//  ViewController.swift
//  Liar's Dice
//
//  Created by Tommaso Parisotto on 14/02/2020.
//  Copyright © 2020 CogMod. All rights reserved.
//

import UIKit

// color scheme
// green       006600
// light brown 99621E
// dark brown  2F1000

class HowToPlayViewController: UIViewController {
    
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil);
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }

}
