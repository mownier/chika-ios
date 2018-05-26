//
//  Home.swift
//  Chika
//
//  Created by Mounir Ybanez on 5/26/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import UIKit

var homeScene: UITabBarController {
    let tab = UITabBarController()
    let tab1 = navigationController(withRoot: inboxScene)
    let tab2 = navigationController(withRoot: contactListScene)
    tab1.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "tab-inbox"), selectedImage: nil)
    tab2.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "tab-contacts"), selectedImage: nil)
    tab1.tabBarItem.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
    tab2.tabBarItem.imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: -4, right: 0)
    tab.viewControllers = [tab1, tab2]
    tab.tabBar.tintColor = UIColor.black
    return tab
}

@discardableResult
func makeHomeSceneAsRoot(in window: UIWindow? = mainWindow) -> Bool {
    guard window != nil else {
        return false
    }
    window?.rootViewController = homeScene
    return true
}
