//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Mark Engen on 9/10/17.
//  Copyright © 2017 Mark Engen. All rights reserved.
//

import UIKit
import MapKit


class MapViewController: UIViewController {

    var mapView: MKMapView!  //declare a variable of MKMapView type
    //loadView is called when a view's view property is nil (before we were creating views via the GUI and linking is called where the view doesn't have (i.e. is nil) 
    override func loadView() {
        //Create a map view outside the GUI dragging/dropping interface
        mapView = MKMapView()  //Create an instance of MKMapView in mapView
        view = mapView
        
        //let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        let standardString = NSLocalizedString("Standard", comment: "Standard map view")
        let satelliteString = NSLocalizedString("Satellite", comment: "Satellite map view")
        let hybridString = NSLocalizedString("Hybrid", comment: "Hybrid map view")
        let segmentedControl = UISegmentedControl(items: [standardString, satelliteString, hybridString])
        
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        
        segmentedControl.selectedSegmentIndex = 0
        
        
        //Page 108 explains what the next line does in the iOS Programming book
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        segmentedControl.addTarget(self,
                                   action: #selector(MapViewController.mapTypeChanged(_:)),
                                   for: .valueChanged)
        
        view.addSubview(segmentedControl)
        //We now have a view, but nobody will ever see it until we do something else.
        
        //Let's create some layout contraint instances...
        //Align the Standard, Hybrid and Satellite buttons with the top of the parent view
        //segmentedControl.topAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: -50).isActive = true
        //segmentedControl.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: -8).isActive = true
        
        //Align the Standard, Hybrid and Satellite buttons with the left edge of the parent view
        //segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
        //Align the Standard, Hybrid and Satellite buttons with the right edge of the parent view
        //segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
        //Now we activate the constraint instances defined above using the isActive property
        //See page 110 in iOS Programming for further info on the below commands and what they affect in the view hierarchy
        
        //let topConstraint = segmentedControl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8)
        
        
    }
    
    func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }

    /* viewWillAppear will execute just before, and each time the view is called to load.  Executes after viewDidLoad */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Map View has focus")
    }
    
    /* viewDidLoad executes only once when the view is loaded initially */
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MapViewController did load.")
    }
    
}
