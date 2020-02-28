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

class StartScreenViewController: UIViewController {
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var howToPlayButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Aesthetic stuff
        playButton.layer.cornerRadius = 5
        howToPlayButton.layer.cornerRadius = 5
    
    }

}

