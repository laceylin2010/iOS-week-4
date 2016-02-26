//
//  UserSearchViewController.swift
//  GoGoGithub
//
//  Created by Lacey Vu on 2/25/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class OwnerSearchViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, Identity,UISearchBarDelegate
{

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var ownerSearchBar: UISearchBar!
    
    class func id() -> String
    {
        return "OwnerSearchViewController"
    }
    
    var dataSource = [Owner](){
        didSet {
            self.collectionView.reloadData()
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
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let userCell = self.collectionView.dequeueReusableCellWithReuseIdentifier("OwnerCollectionViewCell", forIndexPath: indexPath) as! OwnerCollectionViewCell
        
        let currentCellOwner = self.dataSource[indexPath.row]
        
        userCell.owner = currentCellOwner
        return userCell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.dataSource.count
        
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar)
    {
        if let text = searchBar.text {
            Owner.ownerSearchInfo(text) { (success, githubOwners) -> () in
                self.dataSource = githubOwners
            }
        }
    }
    
    
}


extension OwnerSearchViewController
{

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == UserDetailViewController.id() {
            
            if let userDetailViewController = segue.destinationViewController as? UserDetailViewController {
                if let indexPath = self.collectionView.indexPathsForSelectedItems()?.first {
                    let owner = self.dataSource [indexPath.row]
                    userDetailViewController.owner = owner
                }
                
            }
        }
        
    }
    
}
