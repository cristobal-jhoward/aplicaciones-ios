//
//  StarWarsAffiliation.swift
//  Star Wars
//
//  Created by master on 17/12/2020.
//  Copyright © 2020 master. All rights reserved.
//

import Foundation
enum StarWarsAffiliation : String {
    case galacticEmpire = "Galactic Empire"
    case rebelAlliance = "Rebel Alliance"
    case firstOrder = "First Order"
    case jabbaCriminalEmpire = "Jabba's Criminal Empire"
    case unknown = "Unknown"
    
    static func byName(_ name:String) -> StarWarsAffiliation {
        let aff : StarWarsAffiliation
        
        switch name {
        case StarWarsAffiliation.galacticEmpire.rawValue:
            aff = .galacticEmpire
        case StarWarsAffiliation.rebelAlliance.rawValue:
            aff = .rebelAlliance
        case StarWarsAffiliation.jabbaCriminalEmpire.rawValue:
            aff = .jabbaCriminalEmpire
        case StarWarsAffiliation.firstOrder.rawValue:
            aff = .firstOrder
        default:
            aff = .unknown
        }
        
        return aff
    }
    
    static func byName(_ name:String?) -> StarWarsAffiliation {
        
        guard case .some(let affiliationName) = name else {
            return .unknown
        }
        
        return byName(affiliationName)
    }
}
