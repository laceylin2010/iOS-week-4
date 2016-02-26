//
//  UserDetailViewController.swift
//  GoGoGithub
//
//  Created by Lacey Vu on 2/25/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!

    
    var user: User? {
        didSet {
            self.tableView.reloadData()
        }
        
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()

    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        //
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        //
    }
    
    
    
    
    
    
    
    


}
