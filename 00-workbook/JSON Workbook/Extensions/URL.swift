//
//  Bundle.swift
//  TaskList
//
//  Created by Brent Crowley on 22/8/2023.
//  Copyright © 2023 Seventh Beam. All rights reserved.
//

import Foundation

extension URL {
    
    private enum ModelJSON<T: Codable> {
        case decode(URL), encode(T, URL)
        
        func perform() throws -> T {
            
            switch self {
            case .encode(let model, let url):
                let encoder = JSONEncoder()
                encoder.outputFormatting = .prettyPrinted
                
                let json = try encoder.encode(model)
                
                try json.write(to: url, options: .atomic)
                
                return model
                
            case .decode(let url):
                let json = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let result = try decoder.decode(T.self, from: json)
                
                return result

            }
        }
    }
    
    enum URLError: Error  {
        
        case invalidJSONFileURL
    }
    
    static func loadBundleJSONFilename<T: Codable>(_ filename: String) throws -> T {
        try URL.loadJSONFromURL(Bundle.main.url(forResource: filename, withExtension: "json"))
    }
    
    static func loadJSONFromURL<T: Codable>(_ url: URL?) throws -> T {
        
        guard let jsonURL = url else { throw URLError.invalidJSONFileURL }
        
        return try URL.ModelJSON.decode(jsonURL).perform()
        
    }
    
    func getModelFromJSON<T: Codable>() throws -> T {
        return try URL.ModelJSON.decode(self).perform()
    }
    
    static func writeJSONModel<T: Codable>(_ model: T, toURL url: URL) {
        do {
            let _ = try URL.ModelJSON.encode(model, url).perform()
        } catch let error {
            print(error)
        }
    }
    
    func writeModelToJSON<T: Codable>(_ model: T) {
        do {
            let _ = try URL.ModelJSON.encode(model, self).perform()
        } catch let error {
            print(error)
        }
    }
}
