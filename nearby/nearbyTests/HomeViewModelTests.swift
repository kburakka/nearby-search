//
//  HomeViewModelTests.swift
//  nearbyTests
//
//  Created by Burak Kaya on 08.01.22.
//

import XCTest
@testable import nearby

class HomeViewModelTests: XCTestCase {

    var viewModel : HomeViewModel!

    override func setUp() {
        super.setUp()
        self.viewModel = HomeViewModel(router: HomeRouter(), dataProvider: ApiProvider.shared)
    }

    override func tearDown() {
        self.viewModel = nil
    }
    
    func testFetchVenues() {
        viewModel.fetchVenues(lat: 52.520008, lng: 13.404954, radius: 1000) { [weak self] in
            XCTAssertTrue(self?.viewModel.venues != [])
        }
    }
    
    func testNumberOfItemsInSection() {
        viewModel.venues = [Venue(poi: nil, address: nil, position: nil),
                            Venue(poi: nil, address: nil, position: nil),
                            Venue(poi: nil, address: nil, position: nil)]
        XCTAssertTrue(viewModel.numberOfItemsInSection(section: 1) == 3)
    }
    
    func testCellForItemAt() {
        let targetValue = Venue(poi: Poi(name: "TEST", phone: "1234"), address: nil, position: nil)
        viewModel.venues = [targetValue,
                            Venue(poi: nil, address: nil, position: nil),
                            Venue(poi: nil, address: nil, position: nil)]
        
        XCTAssertTrue(viewModel.cellForItemAt(indexPathRow: 0).venue.poi?.name == targetValue.poi?.name)
    }
    
}
