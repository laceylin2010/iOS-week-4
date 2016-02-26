//
//  Owner.swift
//  GoGoGithub
//
//  Created by Lacey Vu on 2/23/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class Owner
{
    let login: String
    let htmlUrl: String
    let ownerImageUrl: String

    init(htmlUrl: String, login: String, ownerImageUrl: String)
    {
        self.htmlUrl = htmlUrl
        self.login = login
        self.ownerImageUrl = ownerImageUrl

    }
}
