//
//  AnimalesViewController.swift
//  Edades xib
//
//  Created by master on 04/12/2020.
//  Copyright © 2020 master. All rights reserved.
//

import UIKit

class AnimalesViewController: UIViewController {
    
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var fotoMascota: UIImageView!
    
    var model: CalculaEdad
    
    init(model: CalculaEdad){
        
        self.model = model
        super.init(nibName: nil, bundle: nil)
        
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func findAgeTurtle(_ sender: Any) {
        
        
        model = CalculaEdad(multiplica: 0.4, animal: "Tortuga", foto: #imageLiteral(resourceName: "tortuga"))
        syncModelWidthView()
        
        
    }
    
    @IBAction func findAgeCat(_ sender: Any) {
        
        model = CalculaEdad(multiplica: 5.5, animal: "Gato", foto: #imageLiteral(resourceName: "gato"))
        syncModelWidthView()
    }
    
    func syncModelWidthView(){
        
        result.text = respuesta(años: Float(age.text!)).0
        fotoMascota.image = respuesta(años: Float(age.text!)).1
    }
    
    func respuesta(años: Float?) -> (String, UIImage){
        
        var resTupla = ("Por favor, escribe un valor", UIImage())
        
        guard let res = años else {
            
            return resTupla
        }
       
        resTupla.0 = "Tu \(model.animal) tiene \(res * model.multiplica) años humanos"
        resTupla.1 = model.foto
        
        return resTupla
    }


}
