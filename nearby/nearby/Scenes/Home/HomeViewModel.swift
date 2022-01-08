//
//  HomeViewModel.swift
//  nearby
//
//  Created by Burak Kaya on 08.01.22.
//

import Foundation

protocol HomeViewDataSource {
    var venues: [Venue] { get set }
    
    func fetchVenues(lat: Double, lng: Double, radius: Int, completion:@escaping VoidClosure)
    func numberOfItemsInSection(section: Int) -> Int
    func cellForItemAt(indexPathRow: Int) -> VenueCellModel
}

protocol HomeViewEventSource {
    func settingsTapped()
}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {}

final class HomeViewModel: BaseViewModel<HomeRouter>, HomeViewProtocol {

    private var venueCellModels: [VenueCellModel] = []
    var venues: [Venue] = [] {
        didSet {
            setVenueCellModels()
        }
    }
    
    func fetchVenues(lat: Double, lng: Double, radius: Int, completion: @escaping VoidClosure) {
        let request = NearbyVenuesRequest(lat: lat, lng: lng, radius: radius)
        dataProvider.request(for: request) { [weak self] result in
            switch result {
            case .success(let response):
                self?.venues = response.results
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        return venueCellModels.count
    }
    
    func cellForItemAt(indexPathRow: Int) -> VenueCellModel {
        return venueCellModels[indexPathRow]

    }
    
    func settingsTapped() {
        router.pushSettings()
    }
    
    private func setVenueCellModels() {
        venueCellModels = []
        for venue in venues {
            venueCellModels.append(VenueCellModel(venue: venue))
        }
    }
}
