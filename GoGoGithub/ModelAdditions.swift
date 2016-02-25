//
//  ModelAdditions.swift
//  GoGoGithub
//
//  Created by Lacey Vu on 2/23/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

extension Repository
{
    class func update(completion: (success: Bool, repositories: [Repository]) -> ())
    {
        API.shared.enqueue(GETRepositoriesRequest()) { (success, json) -> () in
            var repositories = [Repository]()
            
            for eachRepository in json {
                guard let ownerDictionary = eachRepository["owner"] as? [String : AnyObject] else { return }
                let reposUrl = ownerDictionary["repos_url"] as? String ?? kEmptyString
                let login = ownerDictionary["login"] as? String ?? kEmptyString
                let owner = Owner(reposUrl: reposUrl, name: login)
                
                
                let name = eachRepository["name"] as? String ?? kEmptyString
                
                let repo = Repository(name: name, owner: owner)
                
                repositories.append(repo)

                
            }
            
            NSOperationQueue.mainQueue().addOperationWithBlock { completion(success: true, repositories: repositories) }
        }
    }
    
    class func searchInfo(results: String, completion: (success: Bool, repositories: [Repository]) -> ())
    {
        API.shared.enqueue(GETSearch(userSearch: results)) { (success, json) -> () in
            var repositories = [Repository]()
            
            for eachRepository in json {
                guard let ownerDictionary = eachRepository["owner"] as? [String : AnyObject] else { return }
                let reposUrl = ownerDictionary["repos_url"] as? String ?? kEmptyString
                let login = ownerDictionary["login"] as? String ?? kEmptyString
                let owner = Owner(reposUrl: reposUrl, name: login)
                
                
                let name = eachRepository["name"] as? String ?? kEmptyString
                
                let repo = Repository(name: name, owner: owner)
                
                repositories.append(repo)
                
                
            }
            
            NSOperationQueue.mainQueue().addOperationWithBlock { completion(success: true, repositories: repositories) }
        }
    }
}


extension User
{
    class func update(completion: (success: Bool, user: User?) -> ())
    {
        API.shared.enqueue(GETUser()) { (success, json) -> () in
            var currentUser = [User]()
           
            
            for eachUser in json {
                let avatarUrl = eachUser["avatar_url"] as? String ?? kEmptyString
                let name = eachUser["name"] as? String ?? kEmptyString
                let createdAt = eachUser["created_at"] as? String ?? kEmptyString
                
                currentUser.append(User(name: name, imageUrl: avatarUrl, createdAt: createdAt))
                
            }
            
            if let user = currentUser.first {
                
                NSOperationQueue.mainQueue().addOperationWithBlock { completion(success: true, user: user)
                    
                }
            }
            
            
        }
    }
}

