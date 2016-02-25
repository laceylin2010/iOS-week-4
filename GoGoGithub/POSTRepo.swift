//
//  POSTRepo.swift
//  GoGoGithub
//
//  Created by Lacey Vu on 2/24/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import Foundation

class POSTRepo: APIRequest
{
    var httpMethod = HTTPMethod.POST
    
    var newRepo: String
    
    init(newRepo: String)
    {
        self.newRepo = newRepo
    }
    
    func url() -> String {
        return "https://api.github.com/user/repos"
    }
    
    func queryStringParameters() -> [String : String]?
    {
        do {
            let token = try GithubOAuth.shared.accessToken()
            return ["access_token" : token]
        } catch _ {}
        return nil
        
    }
    
    func httpBody() -> NSData?
    {
        return try! NSJSONSerialization.dataWithJSONObject(["name" : self.newRepo], options: .PrettyPrinted)
    }
    
    
}