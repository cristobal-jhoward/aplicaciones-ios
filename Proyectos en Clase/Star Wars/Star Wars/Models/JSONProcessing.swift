//
//  JSONProcessing.swift
//  Star Wars
//
//  Created by master on 01/02/2021.
//  Copyright © 2021 master. All rights reserved.
//

import Foundation
import UIKit

/*

{
"firstName"    : "Anakin",
"lastName"     : "Skywalker",
"alias"        : "Darth Vader",
"soundFile"    : "vader.caf",
"imageFile"    : "vader.jpg",
"jedi"         : false,
"sith"         : true,
"affiliation"  : "Galactic Empire",
"url"          : "https://en.wikipedia.org/wiki/Darth_Vader",
"midichlorians": 15000
}, */

typealias JSONObject = Any

typealias JSONDictionary = [String: JSONObject]

typealias JSONArray = [JSONDictionary]

func decode(starWarsCharacter json: JSONDictionary) throws -> StarWarsCharacter {
    
    guard let urlString = json["url"] as? String, let url = URL(string: urlString) else {
        throw StarWarsError.wrongURLFormatForJSONresource
    }
    
    guard let imageName = json["imageFile"] as? String, let image = UIImage(named: imageName) else {
        throw StarWarsError.resourcePointedByURLNotReachable
    }
    
    guard let soundName = json["soundFile"] as? String,
        let soundURL = Bundle.main.URLForResource(soundName),
        let sound = try? Data(contentsOf: soundURL) else{
            throw StarWarsError.resourcePointedByURLNotReachable
    }
    
    let firstName = json["firstName"] as? String
    let lastName = json["lastName"] as? String
    let alias = json["alias"] as? String
    
    if let affiliation = json["affiliation"] as? String {
        
        return StarWarsCharacter(firstName: firstName, lastName: lastName, alias: alias, soundData: sound, photo: image, url: url, affiliation: StarWarsAffiliation.byName(affiliation) )
        
    }
    
    return StarWarsCharacter(
    alias: "C-3PO",
    soundData: try! Data(contentsOf: Bundle.main.url(forResource: "c3po", withExtension: "caf")!),
    photo: UIImage(named: "c3po.jpg")!,
    url: URL(string: "https://en.wikipedia.org/wiki/C-3PO")!,
    affiliation: .rebelAlliance
    )
    
}

func decode(forceSensitive json: JSONDictionary) throws -> ForceSensitive {
    
    return ForceSensitive(
    sithWithFirstName: "Anakin",
    lastName: "Skywalker", alias: "Darth Vader",
    soundData: try! Data(contentsOf: Bundle.main.url(forResource: "vader", withExtension: "caf")!),
    photo: UIImage(named: "vader.jpg")!,
    url: URL(string: "https://en.wikipedia.org/wiki/Darth_Vader")!,
    midichlorians: 15000
    
    )
    
}

func loadFromLocalFile(fileName name: String, bundle: Bundle = Bundle.main) throws -> [[String: JSONObject]] {
    
    //Decodificar todo el archivo
    
    let array = [ ["nombre": "Ana", "edad": 27 ] ]
    return array
    
}
