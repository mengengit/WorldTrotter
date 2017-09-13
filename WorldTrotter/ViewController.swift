//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Mark Engen on 9/11/17.
//  Copyright © 2017 Mark Engen. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet var webView: UIWebView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let electronicArmoryURL = URL(string: "http://www.topprice4yourhome.com/message2-working.php")
        let electronicArmoryURLRequest = URLRequest(url: electronicArmoryURL!)
        webView.loadRequest(electronicArmoryURLRequest)
        print("Got here")
        
        /* changing text colors in tab bar courtesy of https://stackoverflow.com/questions/31117069/changing-tab-bar-item-image-and-text-color-ios */
        
        let selectedColor   = UIColor(red: 180.0/255.0, green: 180.0/255.0, blue: 180.0/255.0, alpha: 3.0)
        let unselectedColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 3.0)
        
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: selectedColor], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: unselectedColor], for: .selected)

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Map View has focus")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

}
