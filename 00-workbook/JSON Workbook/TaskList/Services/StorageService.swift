//
//  StorageService.swift
//  TaskList
//
//  Created by Brent Crowley on 22/8/2023.
//  Copyright © 2023 Seventh Beam. All rights reserved.
//

import Foundation
import Combine

protocol Storable {
        
    associatedtype Model: Codable
    
    var filename: String { get }
    var pathExtension: String { get }
    
    // Required
    func makeModel() throws -> Model
    func writeModel(_ model: Model) throws
    
}

extension Storable {
    var fileURL: URL {
        let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return URL(fileURLWithPath: filename, relativeTo: documentsDirectoryURL).appendingPathExtension(pathExtension)
    }
}

// MARK: - PList Storable

struct PlistService<T: Codable>: Storable {

    let filename: String
    let pathExtension = "plist"
    
    typealias Model = T

    func writeModel(_ model: T) throws {
        let encoder = PropertyListEncoder()
        let data = try encoder.encode(model)
        try data.write(to: fileURL, options: .atomic)
    }
    
    func makeModel() throws -> Model {
        
        let data = try Data(contentsOf: fileURL)
        let decoder = PropertyListDecoder()
        return try decoder.decode(T.self, from: data)

    }
}

// MARK: - JSON Storable

struct JSONService<T: Codable>: Storable {

    let filename: String
    let pathExtension = "json"
    
    typealias Model = T

    func writeModel(_ model: T) throws {
        let encoder = PropertyListEncoder()
        let data = try encoder.encode(model)
        try data.write(to: fileURL, options: .atomic)
    }
    
    func makeModel() throws -> Model {
        
        let data = try Data(contentsOf: fileURL)
        let decoder = PropertyListDecoder()
        return try decoder.decode(T.self, from: data)

    }
}
