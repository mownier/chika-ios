//
//  Root.swift
//  Chika
//
//  Created by Mounir Ybanez on 5/25/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import UIKit

func navigationController(withRoot root: UIViewController) -> UINavigationController {
    let nav = UINavigationController(rootViewController: root)
    nav.navigationBar.tintColor = UIColor.black
    return nav
}

var mainWindow: UIWindow? {
    return (UIApplication.shared.delegate as? AppDelegate)?.window
}
