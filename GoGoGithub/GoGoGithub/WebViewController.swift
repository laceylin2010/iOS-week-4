//
//  WebViewController.swift
//  GoGoGithub
//
//  Created by Lacey Vu on 2/25/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit
import WebKit

typealias WebViewControllerDismiss = () -> ()

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
    
    @IBAction func backButton(sender: UIButton)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func loadWebView()
    {
        let frame = CGRect(x: 0.0, y: 50.0, width: self.view.frame.width, height: self.view.frame.height)
        let webView = WKWebView(frame: frame)
        if let htmlUrl = owner?.htmlUrl{
            let url = NSURL(string: htmlUrl)
            let request = NSMutableURLRequest(URL: url!)
            
            self.view.addSubview(webView)
            webView.loadRequest(request)
        }
        
    }
    
    

    

}
