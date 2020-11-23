//
//  personajesStarWars.swift
//  APPSW 01
//
//  Created by Fernando on 18/11/20.
//

import Foundation
import UIKit

let chars : [StarWarsCharacter] = [
    
    StarWarsCharacter(firstName: "Wilhuf",
                      lastName: "Tarkin",
                      alias: "Grand Moff Tarkin",
                      soundData: try! Data(contentsOf: Bundle.main.url(forResource: "tarkin", withExtension: "caf")!),
                      photo: UIImage(named: "tarkin.jpg")!,
                      url: URL(string: "https://en.wikipedia.org/wiki/Tarkin")!,
                      affiliation: .galacticEmpire),
    
    StarWarsCharacter(alias: "C-3PO",
                      soundData: try! Data(contentsOf: Bundle.main.url(forResource: "c3po", withExtension: "caf")!),
                      photo: UIImage(named: "c3po.jpg")!,
                      url: URL(string: "https://en.wikipedia.org/wiki/C-3PO")!,
                      affiliation: .rebelAlliance),
    
    StarWarsCharacter(alias: "R2-D2",
                      soundData: try! Data(contentsOf: Bundle.main.url(forResource: "r2-d2", withExtension: "caf")!),
                      photo: UIImage(named: "r2-d2.jpg")!,
                      url: URL(string: "https://en.wikipedia.org/wiki/R2-D2")!,
                      affiliation: .rebelAlliance),
    
    StarWarsCharacter(alias: "Chewbacca",
                      soundData: try! Data(contentsOf: Bundle.main.url(forResource: "chewie", withExtension: "caf")!),
                      photo: UIImage(named: "chewie.jpg")!,
                      url: URL(string: "https://en.wikipedia.org/wiki/Chewbacca")!,
                      affiliation: .rebelAlliance),
    
    StarWarsCharacter(firstName: "Jabba",
                      lastName: "Desilijic Tiure",
                      alias: "Jabba The Hutt",
                      soundData: try! Data(contentsOf: Bundle.main.url(forResource: "jabba", withExtension: "caf")!),
                      photo: UIImage(named: "jabba.jpg")!,
                      url: URL(string: "https://en.wikipedia.org/wiki/Jabba_the_Hutt")!,
                      affiliation: .jabbaCriminalEmpire),
    
    StarWarsCharacter(alias: "Greedo",
                      soundData: try! Data(contentsOf: Bundle.main.url(forResource: "greedo", withExtension: "caf")!),
                      photo: UIImage(named: "greedo.jpg")!,
                      url: URL(string: "https://en.wikipedia.org/wiki/Greedo")!,
                      affiliation: .jabbaCriminalEmpire),
    
    StarWarsCharacter(firstName: "Conan Antonio",
                      lastName: "Motti",
                      alias: "Admiral Motti",
                      soundData: try! Data(contentsOf: Bundle.main.url(forResource: "motti", withExtension: "caf")!),
                      photo: UIImage(named: "motti.jpg")!,
                      url: URL(string: "https://en.wikipedia.org/wiki/Richard_LeParmentier")!,
                      affiliation: .galacticEmpire),
    
    StarWarsCharacter(firstName: "Leia",
                      lastName: "Organa",
                      alias: "Princess Leia",
                      soundData: try! Data(contentsOf: Bundle.main.url(forResource: "leia", withExtension: "caf")!),
                      photo: UIImage(named: "leia.jpg")!,
                      url: URL(string: "https://en.wikipedia.org/wiki/Princess_Leia")!,
                      affiliation: .rebelAlliance),
    
    
    StarWarsCharacter(firstName: "Padme",
                      lastName: "Naberrie",
                      alias: "Amidala",
                      soundData: try! Data(contentsOf: Bundle.main.url(forResource: "padme", withExtension: "wav")!),
                      photo: UIImage(named: "padme.jpg")!,
                      url: URL(string: "https://en.wikipedia.org/wiki/Padm%C3%A9_Amidala")!,
                      affiliation: .rebelAlliance),
    
    StarWarsCharacter(firstName: "Fernando",
                      lastName: "Cordón",
                      alias: "Profe del Master",
                      soundData: try! Data(contentsOf: Bundle.main.url(forResource: "sable", withExtension: "mp3")!),
                      photo: UIImage(named: "fernando.jpg")!,
                      url: URL(string: "https://en.wikipedia.org/wiki/Princess_Leia")!,
                      affiliation: .unknown),
    
    StarWarsCharacter(firstName: "Boba",
                      lastName: "Fet",
                      alias: "El cazarrecompensas",
                      soundData: try! Data(contentsOf: Bundle.main.url(forResource: "boba", withExtension: "wav")!),
                      photo: UIImage(named: "boba.jpg")!,
                      url: URL(string: "https://es.wikipedia.org/wiki/Boba_Fett")!,
                      affiliation: .galacticEmpire)
]
