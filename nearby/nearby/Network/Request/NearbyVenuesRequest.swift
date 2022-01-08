//
//  NearbyVenuesRequest.swift
//  nearby
//
//  Created by Burak Kaya on 08.01.22.
//

import Foundation

struct NearbyVenuesRequest: APIDecodableResponseRequest {
    typealias ResponseType = NearbyVenues
    var path: String = "nearbySearch/.json?"
    var method: RequestMethod = .get
    
    init(lat: Double, lng: Double, radius: Int) {
        self.path = "nearbySearch/.json?lat=\(lat)&lon=\(lng)&radius=\(radius)"
    }
}
