//
//  ContactList.swift
//  Chika
//
//  Created by Mounir Ybanez on 5/26/18.
//  Copyright © 2018 Nir. All rights reserved.
//

import ChikaContactList
import ChikaCore

var contactListScene: ChikaContactList.Scene {
    return contactListScene(
        onSelectContact: { print("contact: \($0)") }
    )
}

func contactListScene(onSelectContact: @escaping (Contact) -> Void) -> ChikaContactList.Scene {
    let factory = ChikaContactList.Factory()
    let scene = factory
        .onSelectContact { onSelectContact($0) }
        .build()
    return scene
}
