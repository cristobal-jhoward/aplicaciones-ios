//
//  Errors.swift
//  Star Wars
//
//  Created by master on 01/02/2021.
//  Copyright © 2021 master. All rights reserved.
//

import Foundation

enum StarWarsError: Error {
    
    // Para cuando no es una url valida
    case wrongURLFormatForJSONresource
    
    // url valida pero apunta a un archivo que no esta alli
    case resourcePointedByURLNotReachable
    
    // Que el JSON no sea correcto
    case jsonParsingError
    
    // Que el json este bien hecho pero no vale para el modelo
    case wrongJSONFormat
    
    // Da un nil
    case nilJSONObject
}
