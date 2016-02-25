//
//  GETUser.swift
//  GoGoGithub
//
//  Created by Lacey Vu on 2/24/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class GETUser: APIRequest
{
    var httpMethod = HTTPMethod.GET
    var headerContentType = MIMEType.ApplicationJSON
    
    func url() -> String
    {
        return "https://api.github.com/user"
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