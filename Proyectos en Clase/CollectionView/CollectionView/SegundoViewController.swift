//
//  SegundoViewController.swift
//  CollectionView
//
//  Created by master on 18/01/2021.
//  Copyright © 2021 master. All rights reserved.
//

import UIKit

class SegundoViewController: UIViewController {
    
    var datosQueLlegan = UIImage()
    
    @IBOutlet weak var imagenCiudad: UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        imagenCiudad.image = datosQueLlegan
    }
    



}
