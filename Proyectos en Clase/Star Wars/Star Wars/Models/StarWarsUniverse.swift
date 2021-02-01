//
//  StarWarsUniverse.swift
//  Star Wars
//
//  Created by master on 15/01/2021.
//  Copyright © 2021 master. All rights reserved.
//

import Foundation
import UIKit

class StarWarsUniverse {

    //Typealias

typealias StarWarsArray = [StarWarsCharacter]
typealias StarWarsDictionary = [StarWarsAffiliation : StarWarsArray]
    
    var dict : StarWarsDictionary = StarWarsDictionary()
    
    init(character chars: StarWarsArray){
        dict = makeEmptyAffiliations()
        
        for each in chars {
            dict[each.affiliation]?.append(each)
            
        }
    }
    
    // Responder al Data Source
    
    var affiliationCount : Int {
        get {
            return dict.count
        }
    }
    
    // Cuantas filas en cada seccion
    func characterCount(forAffiliation affiliation: StarWarsAffiliation) -> Int {
        //return dict[affiliation]!.count
        
        guard let count = dict[affiliation]?.count else{
            return 0
        }
        
        return count
    }
    
    // Para rellenar en cada numero de fila de cada seccion el personaje que corresponda
    
    func character(atIndex index:Int, forAffiliation affiliation: StarWarsAffiliation) -> StarWarsCharacter{
        
        let chars = dict[affiliation]!.sorted()
        let char = chars[index]
        
        return char
    }
    
    // Nombre de la seccion
    func affiliationName(_ affiliation : StarWarsAffiliation) -> String{
        return affiliation.rawValue
    }
    
    func makeEmptyAffiliations() -> StarWarsDictionary {
        var d = StarWarsDictionary()
        
        d[.rebelAlliance] = StarWarsArray()
        d[.galacticEmpire] = StarWarsArray()
        d[.jabbaCriminalEmpire] = StarWarsArray()
        d[.firstOrder] = StarWarsArray()
        d[.unknown] = StarWarsArray()
        
        return d
        
    }

}
