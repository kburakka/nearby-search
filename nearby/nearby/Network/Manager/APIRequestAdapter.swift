//
//  APIRequestAdapter.swift
//  nearby
//
//  Created by Burak Kaya on 08.01.22.
//

import Alamofire

struct APIRequestAdapter {
    let method: HTTPMethod
    let parameters: Parameters
    let headers: HTTPHeaders
    let encoding: ParameterEncoding
    let url: String
    
    init<T: RequestProtocol>(request: T) {
        self.method = request.method.toAlamofireHTTPMethod
        self.parameters = request.parameters
        var headers: HTTPHeaders = [:]
        request.headers.forEach({ headers[$0.key] = $0.value })
        self.headers = headers
        self.encoding = request.encoding.toAlamofireEncoding
        self.url = request.url
    }
}

// MARK: - Get Alamofire HTTPMethod
extension RequestMethod {
    var toAlamofireHTTPMethod: HTTPMethod {
        switch self {
        case .get: return .get
        }
    }
}

// MARK: - Get Alamofire ParameterEncoding
extension RequestEncoding {
    var toAlamofireEncoding: ParameterEncoding {
        switch self {
        case .json: return JSONEncoding.default
        case .url: return URLEncoding.default
        }
    }
}
