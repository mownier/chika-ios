//
//  Inbox.swift
//  Chika
//
//  Created by Mounir Ybanez on 5/26/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaInbox
import ChikaCore

var inboxScene: ChikaInbox.Scene {
    return inboxScene(
        onSelectChat: { print("chat: \($0)") }
    )
}

func inboxScene(onSelectChat: @escaping (Chat) -> Void) -> ChikaInbox.Scene {
    let factory = ChikaInbox.Factory()
    let scene = factory
        .onSelect { onSelectChat($0) }
        .build()
    scene.title = "Inbox"
    return scene
}
