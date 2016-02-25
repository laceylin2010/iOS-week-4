//
//  ProfileViewController.swift
//  GoGoGithub
//
//  Created by Lacey Vu on 2/24/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController
{

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var joinedLabel: UILabel!
    

    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        setupProfile()
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    
    }
    
    func setupProfile()
    {
        User.update { (success, user) -> () in
            if success {
                if let user = user {
                    self.userLabel.text = user.name
                    self.joinedLabel.text = user.createdAt
                    API.shared.getImage(user.imageUrl, completion: { (image) -> () in
                        self.profileImage.image = image
                    })
                }
            }
        }
    }

   
  
    

}
