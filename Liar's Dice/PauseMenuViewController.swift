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
    
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var howToPlayButton: UIButton!
    
    @IBAction func closePauseMenuButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil);
    }
    
    @IBAction func newGameButton(_ sender: Any) {
        createAlertAndGoToNewGame(errorTitle: "Start new game?", errorMessage: "Starting a new game will delete your current progress!", className: self)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.newGameButton.layer.cornerRadius = 5
        self.howToPlayButton.layer.cornerRadius = 5
    }
    
    func createAlertAndGoToNewGame(errorTitle: String, errorMessage: String, className: UIViewController) {
        let alertController = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: UIAlertController.Style.alert)
        let ok = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {(action) -> Void in
            //The (withIdentifier: "VC2") is the Storyboard Segue identifier.
            self.performSegue(withIdentifier: "VC2", sender: self)
        })
        let cancel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil)
        
        alertController.addAction(ok)
        alertController.addAction(cancel)
        self.present(alertController, animated: true, completion: nil)
    }
}
