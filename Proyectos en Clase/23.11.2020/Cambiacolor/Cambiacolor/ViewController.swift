//
//  ViewController.swift
//  Cambiacolor
//
//  Created by master on 23/11/2020.
//  Copyright © 2020 master. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var etiqueta: UILabel!
    
    
    
    
    
    
    
    
    @IBAction func ponerMagenta(_ sender: Any) {
        
        etiqueta.text = "Magenta"
        view.backgroundColor = UIColor.magenta
        
        
        
        
    }
    
    
    
    
    
    @IBAction func ponerAmarillo(_ sender: Any) {
        
        
        etiqueta.text = "Amarillo"
        view.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        
        
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        etiqueta.text = "Pulsa los botones"
        view.backgroundColor = UIColor(red: 0.5, green: 0.8, blue: 0, alpha: 1)
    }


}

