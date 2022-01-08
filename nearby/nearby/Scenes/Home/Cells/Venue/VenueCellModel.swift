//
//  VenueCellModel.swift
//  nearby
//
//  Created by Burak Kaya on 08.01.22.
//

import Foundation

protocol VenueCellDataSource: AnyObject {
    var venue: Venue { get }
}

protocol VenueCellEventSource: AnyObject {
    
}

protocol VenueCellProtocol: VenueCellDataSource, VenueCellEventSource {
    
}

final class VenueCellModel: VenueCellProtocol {
    var venue: Venue

    init(venue: Venue) {
        self.venue = venue
    }
}
