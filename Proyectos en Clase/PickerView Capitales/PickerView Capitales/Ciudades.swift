//
//  Ciudades.swift
//  PickerView Capitales
//
//  Created by master on 08/01/2021.
//  Copyright © 2021 master. All rights reserved.
//

import Foundation
import UIKit

struct Ciudades {
    var ciudades : [Ciudad]
    var nombre : String
    
    func numeroCiudades() -> Int{
        
        return ciudades.count
    }
    
    func ciudad(atIndex index : Int) -> Ciudad{
        
        let elElemento = ciudades[index]
        return elElemento
        
    }
}
