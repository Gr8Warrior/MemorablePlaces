//
//  ViewController.swift
//  Memorable Places
//
//  Created by Shailendra Suriyal on 12/01/17.
//  Copyright © 2017 RealDev. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController, MKMapViewDelegate {
    var place = 0;
    
    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Shailu \(place)");
        
        if activePlace != -1 {
            //Get Place details to display on the map
            if places.count > activePlace {
                if let name = places[activePlace]["name"] {
                    
                    if let lat = places[activePlace]["lat"] {
                        
                        if let lon = places[activePlace]["lon"] {
                            
                            if let latitude = Double(lat) {
                                
                                if let longitude = Double(lon) {
                                    let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                                    let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                                    let region = MKCoordinateRegion(center: coordinate, span: span)
                                    map.setRegion(region, animated: true)
                                    
                                    let annotation = MKPointAnnotation()
                                    annotation.coordinate = coordinate;
                                    annotation.title = name;
                                    annotation.subtitle = "I have been there :-)"
                                    map.addAnnotation(annotation)
                                }
                            }
                        }
                    }
                }
            }
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

