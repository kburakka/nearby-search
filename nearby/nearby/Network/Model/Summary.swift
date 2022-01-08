//
//  Summary.swift
//  nearby
//
//  Created by Burak Kaya on 08.01.22.
//

struct Summary: Codable {
    let queryType: String?
    let queryTime, numResults, offset, totalResults: Int?
    let fuzzyLevel: Int?
    let geoBias: GeoBias?
}
