//
//  ViewController.swift
//  testTask
//
//  Created by maks on 09.03.2020.
//  Copyright © 2020 maks. All rights reserved.
//

import UIKit
import Alamofire
import WebKit

class ViewController: UIViewController, WKUIDelegate {
    
    var url = ""
    var name = ""
    var arr = ""
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string: arr)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}

