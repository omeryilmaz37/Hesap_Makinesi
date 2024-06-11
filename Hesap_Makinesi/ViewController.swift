//
//  ViewController.swift
//  Hesap_Makinesi
//
//  Created by Ömer Yılmaz on 10.06.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        print("CALCULATOR")
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        displayLabel.text = sender.currentTitle
        print(displayLabel.text!)
    }

}

