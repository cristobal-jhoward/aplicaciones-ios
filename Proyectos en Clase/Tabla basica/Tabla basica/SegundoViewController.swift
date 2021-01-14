//
//  SegundoViewController.swift
//  Tabla basica
//
//  Created by master on 14/01/2021.
//  Copyright © 2021 master. All rights reserved.
//

import UIKit

class SegundoViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var textoRecibido = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = textoRecibido


    }
    


}
