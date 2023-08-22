//
//  Bundle.swift
//  TaskList
//
//  Created by Brent Crowley on 22/8/2023.
//  Copyright © 2023 Seventh Beam. All rights reserved.
//

import Foundation

extension Bundle {
    
    enum BundleError: Error  {
        
        case noJSONFileInBundle
    }
    
    static func loadBundleJSONFilename<T: Codable>(_ filename: String) throws -> T {
        
        guard let jsonURL = Bundle.main.url(forResource: filename, withExtension: "json") else { throw BundleError.noJSONFileInBundle }
        
        let json = try Data(contentsOf: jsonURL)
        let decoder = JSONDecoder()
        let result:T = try decoder.decode(T.self, from: json)
        
        return result
    }
    
}
