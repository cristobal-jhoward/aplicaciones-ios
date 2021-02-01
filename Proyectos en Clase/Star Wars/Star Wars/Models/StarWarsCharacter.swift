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

extension StarWarsCharacter: CustomDebugStringConvertible {
    var debugDescription: String {
        get {
            if let name = name, let alias = alias {
                return "<\(type(of: self))\(name) -- \(alias)>"
            }
            return "<\(type(of: self))>"
        }
    }
    
    
}

extension StarWarsCharacter: Comparable, ProxyForComparisionAndShorting {
    var proxyForShorting: String {
        
        get {
            return proxyForComparision
        }
    }
    
    
    var proxyForComparision: String {
        get {
            return "\(firstName ?? "")\(lastName ?? "")\(alias ?? "")\(url)"
        }
    }
    
    
    static func == (lhs: StarWarsCharacter, rhs: StarWarsCharacter) -> Bool {
        
        guard ( lhs !== rhs ) else {
            return true
        }
        
        guard (type(of: lhs) == type(of: rhs)) else {
            return true
        }
        
        return lhs.proxyForComparision == rhs.proxyForComparision
    }
    
    
    
    static func < (lhs: StarWarsCharacter, rhs: StarWarsCharacter) -> Bool {
        
        //return lhs.proxyForComparision < rhs.proxyForComparision
        return lhs.proxyForShorting < rhs.proxyForShorting
    }
}

@objc protocol ProxyForComparisionAndShorting {
    
    var proxyForComparision : String { get }
    
    var proxyForShorting : String { get }
}

