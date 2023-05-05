//
//  LocationManager.swift
//  TaskOfSignIn
//
//  Created by Vivek Patel on 01/05/23.
//

import Foundation

import CoreLocation

struct LocationAddress{
    var location: CLLocation
    var city: String?
    var country: String?
    var address: String?
    
    init(location: CLLocation){
        self.location = location
    }
}

typealias handler = () -> ()?

class LocationManager: NSObject {
    public static  let shared = LocationManager()
    
    
    var locationUpdated : handler?
    var currentLocation: LocationAddress?
    
    private var locationManger: CLLocationManager = {
        let locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 10
        
        return locationManager
    }()
    
    func stratLocationUpdates(completed: handler?) {
        locationUpdated = completed
        
        locationManger.delegate = self
        locationManger.requestAlwaysAuthorization()
        locationManger.startUpdatingLocation()
    }
}

extension LocationManager : CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let firstLocation = locations.first else {return}
        
        if CLLocationCoordinate2DIsValid(firstLocation.coordinate){
            print(firstLocation.coordinate)
            currentLocation = .init(location: firstLocation)
            if let update = locationUpdated{
                update()
            }
        }
    }
}
