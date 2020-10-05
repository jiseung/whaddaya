//
//  User.swift
//  whaddaya
//
//  Created by jiseung on 9/28/20.
//  Copyright © 2020 jiseung. All rights reserved.
//

import Foundation

class User {
    var handle: String
    var rooms: [Room]
    
    init(handle: String) {
        self.handle = handle
        self.rooms = []
    }
}
