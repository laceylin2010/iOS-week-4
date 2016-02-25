//
//  HomeViewController.swift
//  GoGoGithub
//
//  Created by Lacey Vu on 2/23/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, Identity, UITableViewDelegate, UITableViewDataSource
{
    
    @IBOutlet weak var repoTableVIew: UITableView!
    
    var repoArray = [Repository]() {
        didSet {
            self.repoTableVIew.reloadData()
        }
    }
    
    
    class func id() -> String
    {
        return "HomeViewController"
    }

    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        displayRepos()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    func setupTableView()
    {
        self.repoTableVIew.dataSource = self
        self.repoTableVIew.delegate = self
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("repoCell", forIndexPath: indexPath)
        let repoData = self.repoArray[indexPath.row]
        cell.textLabel?.text = repoData.name
        cell.detailTextLabel?.text = repoData.owner.reposUrl
        
      
        
        return cell
        
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.repoArray.count
    }    
    
    func displayRepos()
    {
        Repository.update { (success, repositories) -> () in
            self.repoArray = repositories
            self.repoTableVIew.reloadData()
        }
    }


}
