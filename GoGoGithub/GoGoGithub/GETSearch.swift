//
//  Search.swift
//  GoGoGithub
//
//  Created by Lacey Vu on 2/24/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import Foundation

class GETSearch: APIRequest
{
    var httpMethod = HTTPMethod.GET
    var headerContentType = MIMEType.ApplicationJSON
    var userSearch: String
    
    init(userSearch: String)
    {
        self.userSearch = userSearch
    }
    
    func url() -> String {
        return "https://api.github.com/search/repositories"
    }
    
    func queryStringParameters() -> [String : String]?
    {
        do {
            let token = try GithubOAuth.shared.accessToken()
            return ["access_token" : token, "q" : self.userSearch]
        } catch _ {}
        return nil
        
    }
    
}