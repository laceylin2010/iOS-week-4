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
    
    init(reposUrl: String, name: String)
    {
        self.reposUrl = reposUrl
        self.name = name
    }
}
