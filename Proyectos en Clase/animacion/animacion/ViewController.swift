//
//  ViewController.swift
//  animacion
//
//  Created by master on 08/02/2021.
//  Copyright © 2021 master. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var seg : Double = 1.3
    
    @IBOutlet weak var bolita: UIImageView!
    @IBOutlet weak var paraguas: UIImageView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTap))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func didTap(_ tap: UITapGestureRecognizer) {
        
        seg = Double( 5 + arc4random_uniform(11)) / 10.0 //0,5 a 1,5 segundos
       
        let nuevaPosicion = tap.location(in: view)
        
        bolita.center = nuevaPosicion
        
        UIView.animate(withDuration: seg) {
            self.paraguas.center = nuevaPosicion
        }
        
        // 7 + 17 + 30 + 30 + 16
        UIView.animate(withDuration: seg * 0.07, animations: {
            self.paraguas.transform = CGAffineTransform(scaleX: 2, y: 2)
        }) { value in
            
            UIView.animate(withDuration: self.seg * 0.17, animations: {
                self.paraguas.transform = CGAffineTransform(rotationAngle: CGFloat(-80 * Double.pi/180))
            }) { value in
                UIView.animate(withDuration: self.seg * 0.3, animations: {
                    self.paraguas.transform = CGAffineTransform(rotationAngle: CGFloat(100 * Double.pi/180))
                }) { value in
                    UIView.animate(withDuration: self.seg * 0.3, animations: {
                        self.paraguas.transform = CGAffineTransform(rotationAngle: 0)
                    }) { value in
                        UIView.animate(withDuration: self.seg * 0.16) {
                            self.paraguas.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                        }
                    }
                }
            }
        }
        
    }


}

