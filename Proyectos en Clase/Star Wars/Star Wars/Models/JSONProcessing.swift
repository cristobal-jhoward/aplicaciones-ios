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

func decode(starWarsCharacter json: JSONDictionary?) throws -> StarWarsCharacter {
    
    if case .some( let jsonDict ) = json {
        return try decode(starWarsCharacter: jsonDict)
        
    } else {
        throw StarWarsError.nilJSONObject
    }
    
  //  guard let json = json else {
  //      return try decode(starWarsCharacter: json)
   // }
    
}

func decode(forceSensitive json: JSONDictionary) throws -> ForceSensitive {
    
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
    
    guard let jedi = json["jedi"] as? Bool, let sith = json["sith"] as? Bool, let md = json["midichlorians"] as? Int else {
        throw StarWarsError.wrongJSONFormat
    }
    
    guard jedi != sith else {
        throw StarWarsError.wrongJSONFormat
    }
    
    let firstName = json["firstName"] as? String
    let lastName = json["lastName"] as? String
    let alias = json["alias"] as? String
    
    if let affiliation = json["affiliation"] as? String {
        
        let aff = StarWarsAffiliation.byName(affiliation)
        
        if aff == .firstOrder {
            return ForceSensitive(firstName: firstName, lastName: lastName, alias: alias, soundData: sound, photo: image, url: url, affiliation: aff, midichlorians: md)
            
        }else if aff == .galacticEmpire {
            
            return ForceSensitive(sithWithFirstName: firstName, lastName: lastName, alias: alias, soundData: sound, photo: image, url: url, midichlorians: md)
            
        } else {
            
            return ForceSensitive(jediWithFirstName: firstName, lastName: lastName, alias: alias, soundData: sound, photo: image, url: url, midichlorians: md)
        }
            
    } else {
            
            throw StarWarsError.wrongJSONFormat
        }
}

    
    func decode(forceSensitive json: JSONDictionary?) throws -> ForceSensitive {
        
        if case .some( let jsonDict ) = json {
            return try decode(forceSensitive: jsonDict)
            
        } else {
            throw StarWarsError.nilJSONObject
        }
        
    }

func loadFromLocalFile(fileName name: String, bundle: Bundle = Bundle.main) throws -> [[String: JSONObject]] {
    
    if let url = bundle.URLForResource(name),
        let data = try? Data(contentsOf: url),
        let maybeArray = ( try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) ) as? JSONArray?,
        let array = maybeArray {
        
        return array
    } else {
        throw StarWarsError.jsonParsingError
    }
}
