//
//  Bundle.swift
//  TaskList
//
//  Created by Brent Crowley on 22/8/2023.
//  Copyright © 2023 Seventh Beam. All rights reserved.
//

import Foundation

extension URL {
    
    enum URLError: Error  {
        
        case noJSONFileInBundle
        case invalidJSONFileURL
    }
    
    static func loadBundleJSONFilename<T: Codable>(_ filename: String) throws -> T {
        try URL.loadJSONFromURL(Bundle.main.url(forResource: filename, withExtension: "json"))
    }
    
    static func loadJSONFromURL<T: Codable>(_ url: URL?) throws -> T {
        
        guard let jsonURL = url else { throw URLError.invalidJSONFileURL }
        
        let json = try Data(contentsOf: jsonURL)
        let decoder = JSONDecoder()
        let result:T = try decoder.decode(T.self, from: json)
        
        return result
        
    }
}
