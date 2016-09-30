//
//  ViewController.swift
//  MapView
//
//  Created by abderrahmane chafi on 30/09/2016.
//  Copyright © 2016 abderrahmanechafi. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController , MKMapViewDelegate , CLLocationManagerDelegate {
    let locationmap =     CLLocationManager()
    
    
    
    @IBOutlet weak var location: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.locationmap.delegate = self
        self.locationmap.desiredAccuracy = kCLLocationAccuracyBest
        self.locationmap.requestWhenInUseAuthorization()
        self.locationmap.startUpdatingLocation()
        
        self.location.showsUserLocation = true

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations.last
        
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        
        self.location.setRegion(region, animated: true)
        
        self.locationmap.stopUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
    {
        print("Error: " + error.localizedDescription)
    }
    
}



