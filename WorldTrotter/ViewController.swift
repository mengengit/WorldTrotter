// This compiles and runs with no warning

//https://www.hackingwithswift.com/read/4/2/creating-a-simple-browser-with-wkwebview

import UIKit

import WebKit

class ViewController: UIViewController/*, WKNavigationDelegate*/ {
    
    override func loadView() {
        
        var webView: WKWebView!
        
        webView = WKWebView()
        
        /*webView.navigationDelegate = self*/
        
        view = webView
        
        let siteAddress = URL(string: "https://www.gmail.com")
        
        let siteRequest = URLRequest(url: siteAddress!)
        
        webView.load(siteRequest)
        
    }
    
}
