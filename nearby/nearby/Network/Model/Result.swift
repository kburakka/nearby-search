//
//  Result.swift
//  nearby
//
//  Created by Burak Kaya on 08.01.22.
//

struct ResultApi: Codable {
    let id: String?
    let score, dist: Double?
    let poi: Poi?
    let address: Address?
    let position: GeoBias?
}
