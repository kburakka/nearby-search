//
//  LocationManager.swift
//  nearby
//
//  Created by Burak Kaya on 08.01.22.
//

import CoreLocation
import UIKit

class LocationManager: NSObject {
    static let shared = LocationManager()
    private var manager =  CLLocationManager()
    private var didUpdateLocation: LocationClosure?
    private var defaultLocation = CLLocation(latitude: 52.520008, longitude: 13.404954)
    
    override init(){
        super.init()
        manager.delegate = self
        checkAuthorizationStatus()
    }
    
    private func checkAuthorizationStatus() {
        let status = manager.authorizationStatus
        switch status {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            didUpdateLocation?(defaultLocation)
        case .authorizedAlways, .authorizedWhenInUse, .authorized:
            manager.requestLocation()
        @unknown default:
            didUpdateLocation?(defaultLocation)
        }
    }
    
    func getUserLocation(completion: @escaping LocationClosure) {
        didUpdateLocation = completion
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkAuthorizationStatus()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            didUpdateLocation?(location)
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
}
