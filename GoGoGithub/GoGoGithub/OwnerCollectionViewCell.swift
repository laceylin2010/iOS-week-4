//
//  GalleryCollectionViewCell.swift
//  GoGoGithub
//
//  Created by Lacey Vu on 2/25/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class OwnerCollectionViewCell: UICollectionViewCell, Identity
{
    @IBOutlet weak var userImage: UIImageView!
    
    var owner: Owner?{
        didSet{
            imageAppear()
        }
    }
    
    class func id() -> String
    {
        return "OwnerCollectionViewController"
    }
    

    func imageAppear()
    {
        if let owner = owner {
            API.shared.getImage(owner.ownerImageUrl, completion: { (image) -> () in
                self.userImage.image = image
            })
            
        }
    }
    
    
    
}