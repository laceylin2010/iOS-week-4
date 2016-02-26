//
//  GETUserRepos.swift
//  GoGoGithub
//
//  Created by Lacey Vu on 2/25/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class GETUserRepos: APIRequest
{
    var httpMethod = HTTPMethod.GET
    
    var username: String
    
    init(username: String)
    {
        self.username = username
    }
    
    func url() -> String {
        return "https://api.github.com/users/\(self.username)/repos"
    }
    
    func queryStringParameters() -> [String : String]?
    {
        do {
            let token = try GithubOAuth.shared.accessToken()
            return ["access_token" : token]
        } catch _ {}
        return nil
    }
    
}
