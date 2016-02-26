//
//  AppDelegate.swift
//  GoGoGithub
//
//  Created by Lacey Vu on 2/22/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?
    var oauthViewController: OAuthViewController?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        
        self.checkOAuthStatus()
        return true
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool
    {
        GithubOAuth.shared.tokenRequestWithCallbackURL(url, options: SaveOptions.UserDefaults) { (success) -> () in
            if success {
                guard let tabBarController = self.window?.rootViewController as? UITabBarController else
                { fatalError("rootView Controller has been changed") }
                guard let navigationViewController = tabBarController.viewControllers?.first as? UINavigationController else { fatalError("First tab does not have a navigation controller") }
                guard let homeViewController = navigationViewController.viewControllers.first as? HomeViewController else { fatalError("Order of view controllers have changed") }
            
                homeViewController.displayRepos()
                
                guard let oauthViewController = self.oauthViewController else { return }
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    oauthViewController.view.alpha = 0.0
                    }, completion: { (finished) -> Void in
                        oauthViewController.view.removeFromSuperview()
                        oauthViewController.removeFromParentViewController()
                })
            }
            
        }
        return true
    }

    func checkOAuthStatus()
    {
        do {
            let _ = try GithubOAuth.shared.accessToken()
        } catch _ { self.presentOAuthViewController() }
    }
    
    func presentOAuthViewController()
    {
        guard let tabBarController = self.window?.rootViewController as? UITabBarController else { fatalError("root view controller changes") }
        guard let storyboard = tabBarController.storyboard else { fatalError("How is it that this view controller does not have storyboard?") }
        guard let oauthViewController = storyboard.instantiateViewControllerWithIdentifier(OAuthViewController.id()) as? OAuthViewController else { fatalError("Wrong View controller. Fix this please") }
        
        tabBarController.addChildViewController(oauthViewController)
        tabBarController.view.addSubview(oauthViewController.view)
        
        oauthViewController.didMoveToParentViewController(tabBarController)
        
        self.oauthViewController = oauthViewController
    }
    
    
}

