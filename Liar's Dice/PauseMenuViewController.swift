//
//  PauseMenuViewController.swift
//  Liar's Dice
//
//  Created by A. Miculita on 06/03/2020.
//  Copyright © 2020 CogMod. All rights reserved.
//

import UIKit

// color scheme
// green       006600
// light brown 99621E
// dark brown  2F1000

class PauseMenuViewController: UIViewController {
    
    @IBOutlet weak var closePauseMenu: UIButton!
    @IBAction func closePauseMenuButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil);
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
