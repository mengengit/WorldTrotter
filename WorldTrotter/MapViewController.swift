//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Mark Engen on 9/10/17.
//  Copyright © 2017 Mark Engen. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {

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
