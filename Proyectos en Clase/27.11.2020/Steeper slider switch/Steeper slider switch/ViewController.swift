//
//  ViewController.swift
//  Steeper slider switch
//
//  Created by master on 27/11/2020.
//  Copyright © 2020 master. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelSteper: UILabel!
    
    @IBOutlet weak var labelSwitch: UILabel!
    
    @IBOutlet weak var labelSlider: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        labelSteper.text = "Steper"
        labelSwitch.text = "Switch"
        labelSlider.text = "Slider"
    }

    @IBAction func actionSteper(_ sender: UIStepper) {
        
        labelSteper.text = "\(Int(sender.value))"
    }
    
    @IBAction func actionSwitch(_ sender: UISwitch) {
        
        labelSwitch.text = "\(sender.isOn)"
    }
    
    @IBAction func actionSlider(_ sender: UISlider) {
        
        labelSlider.text = "\(Int(sender.value))"
    }
    

}

