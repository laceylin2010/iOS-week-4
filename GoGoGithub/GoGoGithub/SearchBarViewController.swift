//
//  SearchBarViewController.swift
//  GoGoGithub
//
//  Created by Lacey Vu on 2/24/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class SearchBarViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate
{

    @IBOutlet weak var searchTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchArray = [Repository](){
        
        didSet {
            self.searchTableView.reloadData()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()

    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let searchCell = searchTableView.dequeueReusableCellWithIdentifier("searchCell", forIndexPath: indexPath)
        let searchData = self.searchArray[indexPath.row]
        searchCell.textLabel?.text = searchData.name
        
        return searchCell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.searchArray.count
        
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String)
    {
        Repository.searchInfo(searchText) { (success, repositories) -> () in
            self.searchArray = repositories
        }
    }

    
    
}
