//
//  CLLoactionViewController.swift
//  TaskOfSignIn
//
//  Created by Vivek Patel on 01/05/23.
//

import UIKit

class CLLoactionViewController: UIViewController {

    @IBOutlet weak var latitudwLabel: UILabel!
    
    @IBOutlet weak var longitudeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        latitudwLabel.text = "Latitude: 11.09"
//        longitudeLabel.text = "longitude:  64.2312"
        
        LocationManager.shared.stratLocationUpdates { () -> ()? in
            self.showLocation()
        }
    }
    
    func showLocation() {
        if let currentLocation =  LocationManager.shared.currentLocation {
            let coordinate = currentLocation.location.coordinate
            self.latitudwLabel.text = "Latitude : \(coordinate.latitude)"
            self.longitudeLabel.text = "Longitude : \(coordinate.longitude)"
        }
    }



}
