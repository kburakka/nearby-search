//
//  Result.swift
//  nearby
//
//  Created by Burak Kaya on 08.01.22.
//

struct Venue: Codable, Equatable {
    let poi: Poi?
    let address: Address?
    let position: GeoBias?
}
