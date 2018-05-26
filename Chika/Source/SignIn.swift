//
//  SignIn.swift
//  Chika
//
//  Created by Mounir Ybanez on 5/25/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaSignIn

var signInScene: ChikaSignIn.Scene {
    return signInScene(withSuccessBlock: {
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.white
        vc.title = "Home"
        mainWindow?.rootViewController = navigationController(withRoot: vc)
    })
}

func signInScene(withOutput block: @escaping (Error?) -> Void) -> ChikaSignIn.Scene {
    let factory = ChikaSignIn.Factory()
    let scene = factory.withOutput { result in
        switch result {
        case .ok: block(nil)
        case .err(let error): block(error)
        }
    }.build()
    scene.title = "Sign In"
    return scene
}

func signInScene(withSuccessBlock block: @escaping () -> Void) -> ChikaSignIn.Scene {
    let scene = signInScene(withOutput: { error in
        guard error != nil else {
            block()
            return
        }
        let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        mainWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    })
    return scene
}

@discardableResult
func pushSignInScene(from parent: UIViewController?) -> Bool {
    guard parent != nil else {
        return false
    }
    var nav: UINavigationController? = parent as? UINavigationController
    if (nav == nil) {
        nav = parent?.navigationController
    }
    guard nav != nil else {
        return false
    }
    nav?.pushViewController(signInScene, animated: true)
    return true
}
