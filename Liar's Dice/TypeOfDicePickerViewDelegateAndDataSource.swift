//
//  TypeOfDicePickerViewDelegateAndDataSource.swift
//  Liar's Dice
//
//  Created by A. Miculita on 17/02/2020.
//  Copyright © 2020 CogMod. All rights reserved.
//

import UIKit

class TypeOfDicePickerViewDelegateAndDataSource: NSObject, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    //TODO: this will have to use dice images
    var typeOfDicePickerData = ["1", "2", "3", "4", "5", "6"]
    
    var imageArray = [UIImage]()
    
    override init() {
        imageArray.append(UIImage(named: "dice-six-faces-one")!)
        imageArray.append(UIImage(named: "dice-six-faces-two")!)
        imageArray.append(UIImage(named: "dice-six-faces-three")!)
        imageArray.append(UIImage(named: "dice-six-faces-four")!)
        imageArray.append(UIImage(named: "dice-six-faces-five")!)
        imageArray.append(UIImage(named: "dice-six-faces-six")!)
    }
        
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }

    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }


    // MARK: UIPickerViewDelegate

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

        let myImageView = UIImageView(image: imageArray[row])
        myImageView.contentMode = UIView.ContentMode.scaleAspectFit;

        return myImageView
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

       // do something with selected row
    }
}
