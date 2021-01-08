//
//  ViewController.swift
//  Hola Chuck
//
//  Created by master on 08/01/2021.
//  Copyright © 2021 master. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        view.backgroundColor = .red
        
        configView()
        
    }
    func configView(){
        
        let label = UILabel(frame: CGRect(x: 80, y: 300, width: 200, height: 30))
        
        label.backgroundColor = .white
        label.text = "Hola Chuck Norris"
        label.textColor = .black
        label.textAlignment = .center
        
        view.addSubview(label)
        
        
        
    }

}

