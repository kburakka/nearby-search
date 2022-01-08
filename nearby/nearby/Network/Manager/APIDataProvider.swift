//
//  APIDataProvider.swift
//  nearby
//
//  Created by Burak Kaya on 08.01.22.
//

import Alamofire

struct APIDataProvider: DataProviderProtocol {
    private let session: Session
    
    init() {
        self.session = Session()
        self.session.sessionConfiguration.timeoutIntervalForRequest = 20
    }
    
    private func createRequest<T: RequestProtocol>(_ request: T) -> DataRequest {
        let adapter = APIRequestAdapter(request: request)
        let request = session.request(adapter.url,
                                      method: adapter.method,
                                      parameters: adapter.parameters,
                                      encoding: adapter.encoding,
                                      headers: adapter.headers)
        return request
    }
    
    func request<T: DecodableResponseRequest>(for request: T, result: DataProviderResult<T.ResponseType>? = nil) {
        let request = createRequest(request)
        request.validate()
        request.responseDecodable(of: T.ResponseType.self) { (response) in
            switch response.result {
            case .success(let value):
                result?(.success(value))
            case .failure(let error):
                result?(.failure(error))
            }
        }
    }
}
