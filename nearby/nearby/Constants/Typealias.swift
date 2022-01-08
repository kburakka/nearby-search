//
//  Typealias.swift
//  nearby
//
//  Created by Burak Kaya on 08.01.22.
//

typealias RequestParameters = [String: Any]
typealias RequestHeaders = [String: String]
typealias DataProviderResult<T: Decodable> = ((Result<T, Error>) -> Void)
