//
//  GETSearchUser.swift
//  GoGoGithub
//
//  Created by Lacey Vu on 2/25/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import Foundation

class GETSearchOwner: APIRequest
{
    var httpMethod = HTTPMethod.GET
    var searchUser: String
    
    init(searchUser: String)
    {
        self.searchUser = searchUser
    }
    
    func url() -> String
    {
        return "https://api.github.com/search/users"
    }
    
    func queryStringParameters() -> [String : String]?
    {
        do {
            let token = try GithubOAuth.shared.accessToken()
            return ["access_token" : token, "q" : self.searchUser]
        } catch _ {}
        return nil
        
    }
    
}