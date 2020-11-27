//
//  ViewController.swift
//  Temporizador
//
//  Created by master on 27/11/2020.
//  Copyright © 2020 master. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var fotos: UIImageView!
    
    
    var telefonos : [UIImage] = []
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        telefonos = [#imageLiteral(resourceName: "Rojo") ,#imageLiteral(resourceName: "Cabina") , #imageLiteral(resourceName: "Alto") ,#imageLiteral(resourceName: "Azul") , #imageLiteral(resourceName: "Marron") , #imageLiteral(resourceName: "Cajon") , #imageLiteral(resourceName: "Dorado") , #imageLiteral(resourceName: "Movil") ]
        
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (timer) in
            let azar = Int(arc4random_uniform(8))
            self.fotos.image = self.telefonos[azar]
        }
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (timer) in
                  let rojo = CGFloat(arc4random_uniform(255)) / 255
            let verde = CGFloat(arc4random_uniform(255)) / 255
            let azul = CGFloat(arc4random_uniform(255)) / 255
            
            self.view.backgroundColor = UIColor(red: rojo, green: verde, blue: azul, alpha: 1)
        }

}

}
