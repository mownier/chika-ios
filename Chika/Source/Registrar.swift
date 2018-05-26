//
//  Registrar.swift
//  Chika
//
//  Created by Mounir Ybanez on 5/25/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaRegistrar

var registrarScene: ChikaRegistrar.Scene {
    return registrarScene(withSuccessBlock: { makeHomeSceneAsRoot() })
}

func registrarScene(withOutput block: @escaping (Error?) -> Void) -> ChikaRegistrar.Scene {
    let factory = ChikaRegistrar.Factory()
    let scene = factory.withOutput { result in
        switch result {
        case .ok: block(nil)
        case .err(let error): block(error)
        }
    }.build()
    scene.title = "Register"
    return scene
}

func registrarScene(withSuccessBlock block: @escaping () -> Void) -> ChikaRegistrar.Scene {
    let scene = registrarScene(withOutput: { error in
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
func pushRegistrarScene(from parent: UIViewController?) -> Bool {
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
    nav?.pushViewController(registrarScene, animated: true)
    return true
}
