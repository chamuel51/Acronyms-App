//
//  Acronym.swift
//  Acronyms App
//
//  Created by chamuel castillo on 1/18/23.
//
import Foundation

struct Acronym: Decodable, Identifiable {
    var id: String = UUID().uuidString
    let term: String
    let frequency: Int
    let since: Int
    
    enum CodingKeys: String, CodingKey {
        case term = "lf"
        case frequency = "freq"
        case since = "since"
    }
}
