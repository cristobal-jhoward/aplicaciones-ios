//
//  Foundation.swift
//  Star Wars
//
//  Created by master on 03/02/2021.
//  Copyright © 2021 master. All rights reserved.
//

import Foundation

extension Bundle {
    
    func URLForResource(_ name: String?) -> URL? {
        let components : [String]? = name?.components(separatedBy: ".")
        
        let fileTitle = components?.first
        let fileExtension = components?.last
        
        return url(forResource: fileTitle, withExtension: fileExtension)!
    }
}
