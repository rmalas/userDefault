//
//  MapViewController.swift
//  mapApplication
//    //Hello, it is normal version
//  Created by Roman Malasnyak on 4/6/18.
//  Copyright © 2018 Roman Malasnyak. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController,MKMapViewDelegate {
    
    var someEmail = String()
    
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CoordinatesHelper.shared.currentUser = someEmail
        testCoordinates = loadCoordinates()
        updateAnnotationPins()
        createAnnotation()
        print(123)
        print(CoordinatesHelper.shared.rememberUser)
    }
    
    func someFunc()  {
        //let someArray = [["Andrew":"qwerty"],["Paul":"123456"],["Sarah":"123123"]]
    }
    
    
    @IBAction func mapViewLonPress(_ sender: UILongPressGestureRecognizer) {
        guard sender.state != UIGestureRecognizerState.ended, sender.state != UIGestureRecognizerState.changed else { return }
        print("long pressed")
        let location = sender.location(in: mapView)
        let annotation = MKPointAnnotation()
        let coordinates = self.mapView.convert(location, toCoordinateFrom: self.mapView)
        annotation.title = "1234567"
        annotation.subtitle = "123456"
        
        annotation.coordinate = coordinates
        self.mapView.addAnnotation(annotation)
        testCoordinates.append(coordinates)
        storeCoordinates(testCoordinates)
    }
    
    func createAnnotation() {
        let annotation = MKPointAnnotation()
        annotation.coordinate.latitude = CoordinatesHelper.shared.latitude
        annotation.coordinate.longitude = CoordinatesHelper.shared.longitude
        self.mapView.addAnnotation(annotation)
        testCoordinates.append(annotation.coordinate)
        storeCoordinates(testCoordinates)
    }
    
    var testCoordinates = [CLLocationCoordinate2D]()
    
    func storeCoordinates(_ coordinates: [CLLocationCoordinate2D]) {
        let locations = coordinates.map { coordinate -> CLLocation in
            return CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        }
        let archived = NSKeyedArchiver.archivedData(withRootObject: locations)
        UserDefaults.standard.set(archived, forKey: "\(CoordinatesHelper.shared.currentUser)")
        UserDefaults.standard.synchronize()
    }
    
    func loadCoordinates() -> [CLLocationCoordinate2D] {
        guard let archived = UserDefaults.standard.object(forKey: "\(CoordinatesHelper.shared.currentUser)") as? Data,
            let locations = NSKeyedUnarchiver.unarchiveObject(with: archived) as? [CLLocation] else {
                return [CLLocationCoordinate2D]()
        }
        
        let coordinates = locations.map { location -> CLLocationCoordinate2D in
            return location.coordinate
        }
        
        return coordinates
    }
    
    func updateAnnotationPins() {
        for item in testCoordinates {
            let annotation = MKPointAnnotation()
            annotation.coordinate.latitude = item.latitude
            annotation.coordinate.longitude = item.longitude
            self.mapView.addAnnotation(annotation)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        pin.canShowCallout = true
        pin.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        return pin
    }
    


}
