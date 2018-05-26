//
//  Welcome.swift
//  Chika
//
//  Created by Mounir Ybanez on 5/26/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaWelcome

var welcomeScene: ChikaWelcome.Scene {
    return welcomeScene(
        onShowSignIn: { pushSignInScene(from: mainWindow?.rootViewController) },
        onShowRegistration: { pushRegistrarScene(from: mainWindow?.rootViewController) }
    )
}

func welcomeScene(onShowSignIn: @escaping () -> Void, onShowRegistration: @escaping () -> Void) -> ChikaWelcome.Scene {
    let factory = ChikaWelcome.Factory()
    let scene = factory
        .onShowRegistration { onShowRegistration() }
        .onShowSignIn { onShowSignIn() }
        .build()
    return scene
}

@discardableResult
func makeWelcomeSceneAsRoot(in window: UIWindow? = mainWindow) -> Bool {
    guard mainWindow != nil else {
        return false
    }
    window?.rootViewController = navigationController(withRoot: WelcomeSceneWrapper())
    return true
}

class WelcomeSceneWrapper: UIViewController {
    
    var scene: ChikaWelcome.Scene!
    
    override func loadView() {
        super.loadView()
        
        scene = welcomeScene
        view.addSubview(scene.view)
        addChildViewController(scene)
        scene.didMove(toParentViewController: self)
    }
    
    override func viewDidLayoutSubviews() {
        scene.view.frame = view.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
        super.viewWillDisappear(animated)
    }
    
}
