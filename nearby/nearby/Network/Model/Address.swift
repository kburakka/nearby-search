//
//  Address.swift
//  nearby
//
//  Created by Burak Kaya on 08.01.22.
//

struct Address: Codable {
    let streetNumber: String?
    let streetName: String?
    let municipalitySubdivision: String?
    let municipality: String?
    let postalCode: String?
    let country: String?
    let countryCodeISO3: String?
    let freeformAddress: String?
    let localName: String?
}
