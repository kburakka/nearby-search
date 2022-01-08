//
//  HomeViewController.swift
//  nearby
//
//  Created by Burak Kaya on 08.01.22.
//

import UIKit

final class HomeViewController: BaseViewController<HomeViewModel> {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        LocationManager.shared.getUserLocation { location in
            let request = NearbyVenuesRequest(lat: location.coordinate.latitude, lng: location.coordinate.longitude, radius: 1000)
            self.viewModel.dataProvider.request(for: request) { result in
                switch result {
                case .success(let response):
                    print(response)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
}
