//
//  DataProviderProtocol.swift
//  nearby
//
//  Created by Burak Kaya on 08.01.22.
//

import Alamofire

protocol DataProviderProtocol {
    func request<T: DecodableResponseRequest>(for request: T,
                                              result: DataProviderResult<T.ResponseType>?)
}
