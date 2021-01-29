//
//  ForceSensitive.swift
//  Star Wars
//
//  Created by master on 29/01/2021.
//  Copyright © 2021 master. All rights reserved.
//

import Foundation
import UIKit
class ForceSensitive: StarWarsCharacter {
    
    let midichlorians: Int
    
    override var name: String {
        get {
            return "\(super.name!) - \(midichlorians)"
        }
    }
    
    init(firstName: String?, lastName: String?, alias: String?, soundData: Data, photo: UIImage, url: URL, affiliation: StarWarsAffiliation, midichlorians: Int) {
        
        self.midichlorians = midichlorians
        
        super.init(firstName: firstName, lastName: lastName, alias: alias, soundData: soundData, photo: photo, url: url, affiliation: affiliation)
    }
    
    convenience init(jediWithFirstName: String?, lastName: String?, alias: String?, soundData: Data, photo: UIImage, url: URL, midichlorians: Int) {
        
        self.init(
            firstName: jediWithFirstName,
            lastName: lastName,
            alias: alias,
            soundData: soundData,
            photo: photo,
            url: url,
            affiliation: .rebelAlliance,
            midichlorians: midichlorians
        )
    }
    
    convenience init(sithWithFirstName: String?, lastName: String?, alias: String?, soundData: Data, photo: UIImage, url: URL, midichlorians: Int) {
        
        self.init(
            firstName: sithWithFirstName,
            lastName: lastName,
            alias: alias,
            soundData: soundData,
            photo: photo,
            url: url,
            affiliation: .galacticEmpire,
            midichlorians: midichlorians
        )
    }
    
}
