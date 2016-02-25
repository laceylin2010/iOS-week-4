//
//  PostViewController.swift
//  GoGoGithub
//
//  Created by Lacey Vu on 2/24/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    @IBAction func AddRepo(sender: UIButton)
    {
        API.shared.enqueue(POSTRepo(newRepo: textField.text!)) { (success, json) -> () in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    


}
