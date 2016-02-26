//
//  WebViewController.swift
//  GoGoGithub
//
//  Created by Lacey Vu on 2/25/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, Identity
{
    
    var owner: Owner?
    
    class func id() -> String
    {
        return "WebViewController"
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadWebView()

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    
    func loadWebView()
    {
        let webView = WKWebView(frame: self.view.frame)
        if let htmlUrl = owner?.htmlUrl{
            let url = NSURL(string: htmlUrl)
            let request = NSMutableURLRequest(URL: url!)
            
            self.view.addSubview(webView)
            webView.loadRequest(request)
        }
        
    }
    
    

    

}
