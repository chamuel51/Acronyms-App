//
//  APIRequest.swift
//  Acronyms App
//
//  Created by chamuel castillo on 1/19/23.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case badID
}

struct JSONData: Decodable {
    let acronym: String
    let definitions: [Acronym]
    
    enum CodingKeys: String, CodingKey {
        case acronym = "sf"
        case definitions = "lfs"
    }
}

class APIRequest {
    
    func fetch(searchTerm: String) async throws -> [Acronym] {
        guard let url = URL(string:"http://www.nactem.ac.uk/software/acromine/dictionary.py?sf=\(searchTerm)") else {
            throw NetworkError.badURL
        }
        let (data,response) = try await URLSession.shared.data(from: url)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw NetworkError.badID
        }
        let acronymResponse = try? JSONDecoder().decode([JSONData].self, from: data)
        return acronymResponse?.first?.definitions ?? []
    }
}
