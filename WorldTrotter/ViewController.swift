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
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

}
