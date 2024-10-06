//
//  FileManagerDecodable.swift
//  BucketList
//
//  Created by Matthew Kruse on 10/6/24.
//

import Foundation

extension FileManager {
    
    func decode<T: Codable>(_ url: URL) -> T {
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(url) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(url) from bundle due to missing key '\(key.stringValue)' – \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(url) from bundle due to type mismatch – \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(url) from bundle due to missing \(type) value – \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(url) from bundle because it appears to be invalid JSON.")
        } catch {
            fatalError("Failed to decode \(url) from bundle: \(error.localizedDescription)")
        }
        
        /*
         guard let loaded = try? decoder.decode([String: Astronaut].self, from: data) else {
         fatalError("Failed to decode \(file) from bundle.")
         }
         
         return loaded
         */
        
    }
}
