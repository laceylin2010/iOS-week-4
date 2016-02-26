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
                let ownerImageUrl = ownerDictionary["avatar_url"] as? String ?? kEmptyString
                let owner = Owner(reposUrl: reposUrl, login: login, ownerImageUrl: ownerImageUrl)
                
                let name = eachRepository["name"] as? String ?? kEmptyString
                
                let repo = Repository(name: name, owner: owner)
                
                repositories.append(repo)

                
            }
            
            NSOperationQueue.mainQueue().addOperationWithBlock { completion(success: true, repositories: repositories) }
        }
    }
    
    class func searchInfo(results: String, completion:(success: Bool, repositories: [Repository]) -> ())
    {
        API.shared.enqueue(GETSearch(userSearch: results)) { (success, json) -> () in
            var repositories = [Repository]()
            
            for eachRepository in json {
                guard let ownerDictionary = eachRepository["owner"] as? [String : AnyObject] else { return }
                let reposUrl = ownerDictionary["repos_url"] as? String ?? kEmptyString
                let login = ownerDictionary["login"] as? String ?? kEmptyString
                let ownerImageUrl = ownerDictionary["avatar_url"] as? String ?? kEmptyString
                let owner = Owner(reposUrl: reposUrl, login: login, ownerImageUrl: ownerImageUrl)
                
                
                let name = eachRepository["name"] as? String ?? kEmptyString
                
                let repo = Repository(name: name, owner: owner)
                
                repositories.append(repo)
                
                
            }
            
            NSOperationQueue.mainQueue().addOperationWithBlock { completion(success: true, repositories: repositories) }
        }
    }
    
    class func getReposForUser(username: String, completion: (success: Bool, repositories: [Repository]) -> ())
    {
        API.shared.enqueue(GETUserRepos(username: username)) { (success, json) -> () in
            var repositories = [Repository]()
            
            for eachRepository in json {
                guard let ownerDictionary = eachRepository["owner"] as? [String : AnyObject] else { return }
                let reposUrl = ownerDictionary["repos_url"] as? String ?? kEmptyString
                let login = ownerDictionary["login"] as? String ?? kEmptyString
                let ownerImageUrl = ownerDictionary["avatar_url"] as? String ?? kEmptyString
                let owner = Owner(reposUrl: reposUrl, login: login, ownerImageUrl: ownerImageUrl)
                
                
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

extension Owner
{
    class func ownerSearchInfo(results: String, completion:(success: Bool, githubOwners: [Owner]) -> ())
    {
        API.shared.enqueue(GETSearchOwner(searchUser: results)) { (success, json) -> () in
            
            var githubOwners = [Owner]()
            
            for eachOwner in json {
                
                let reposUrl = eachOwner["repos_url"] as? String ?? kEmptyString
                
                let login = eachOwner["login"] as? String ?? kEmptyString
                
                let ownerImageUrl = eachOwner["avatar_url"] as? String ?? kEmptyString
                
                let owner = Owner(reposUrl: reposUrl, login: login, ownerImageUrl: ownerImageUrl)
                
                githubOwners.append(owner)
                
            }
            
            NSOperationQueue.mainQueue().addOperationWithBlock { completion(success: true, githubOwners: githubOwners) }
        }
    }
    
}


