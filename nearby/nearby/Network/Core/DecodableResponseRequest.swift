//
//  DecodableResponseRequest.swift
//  nearby
//
//  Created by Burak Kaya on 08.01.22.
//

protocol DecodableResponseRequest: RequestProtocol {
    associatedtype ResponseType: Decodable
}
