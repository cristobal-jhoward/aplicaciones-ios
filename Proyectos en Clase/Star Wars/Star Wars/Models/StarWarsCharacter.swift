//
//  StarWarsCharacter.swift
//  Star Wars
//
//  Created by master on 17/12/2020.
//  Copyright © 2020 master. All rights reserved.
//

import Foundation

import UIKit
class StarWarsCharacter {
    
    // Propiedades
    
    let firstName : String?
    let lastName : String?
    let alias : String?
    let soundData : Data
    let photo : UIImage
    let url : URL
    let affiliation : StarWarsAffiliation
    
    // Propiedad computada
    
    var name : String? {
        get {
            guard let first = firstName else {
                
                if lastName == nil {
                    if alias == nil {
                        return "nameless"
                    }
                    return "\(alias!)"
                }
                return "\(lastName!)"
            }
            
            guard let last = lastName else {
                return first
            }
            
            return "\(first) \(last)"
        }
    }
    
    // Inicializador designado
    
    init(firstName : String?, lastName : String?, alias : String?, soundData : Data, photo : UIImage, url : URL, affiliation : StarWarsAffiliation) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.alias = alias
        self.soundData = soundData
        self.photo = photo
        self.url = url
        self.affiliation = affiliation
        
    }
    
    
    convenience init(alias: String?, soundData : Data, photo : UIImage, url : URL, affiliation : StarWarsAffiliation) {
        
        self.init(firstName : nil, lastName: nil, alias: alias, soundData : soundData, photo : photo, url : url, affiliation : affiliation)
        
    }

}

