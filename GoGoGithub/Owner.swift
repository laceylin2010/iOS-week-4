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
    let name: String
    let reposUrl: String
    let ownerImageUrl: String

    
    init(reposUrl: String, name: String, ownerImageUrl: String)
    {
        self.reposUrl = reposUrl
        self.name = name
        self.ownerImageUrl = ownerImageUrl
    }
}
