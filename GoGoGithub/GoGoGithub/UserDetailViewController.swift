//
//  UserDetailViewController.swift
//  GoGoGithub
//
//  Created by Lacey Vu on 2/25/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class UserDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, Identity
{
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var owner: Owner?
    
    class func id() -> String
    {
        return "UserDetailViewController"
    }
    
    var usersRepos = [Repository]() {
        didSet {
            self.tableView.reloadData()
        }
        
        
    }
    
    override func viewWillAppear(animated: Bool)
    {
        if let owner = owner{
            print(owner.login)
            Repository.getReposForUser(owner.login, completion: { (success, repositories) -> () in
                if success {
                    self.usersRepos = repositories
                }
            })

        }
        
        
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        imageAppear()

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()

    }
    
    func imageAppear()
    {
        if let owner = owner {
            API.shared.getImage(owner.ownerImageUrl, completion: { (image) -> () in
                self.imageView.image = image
            })
            
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let reuseRepos = self.tableView.dequeueReusableCellWithIdentifier("userRepoCell", forIndexPath: indexPath)
        let repo = self.usersRepos[indexPath.row]
        reuseRepos.textLabel?.text = repo.name
        return reuseRepos
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.usersRepos.count
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        self.performSegueWithIdentifier("WebViewController", sender: nil)
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {

        if segue.identifier == WebViewController.id() {
            
            if let webViewController = segue.destinationViewController as? WebViewController {
                if let indexPath = self.tableView.indexPathForSelectedRow {
                    let repository = self.usersRepos [indexPath.row]
                    webViewController.owner = repository.owner
                }
                
            }
        }
        
    }


    
    
    


}
