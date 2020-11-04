//
//  Room.swift
//  whaddaya
//
//  Created by jiseung on 9/15/20.
//  Copyright © 2020 jiseung. All rights reserved.
//

import Foundation

class Room {
    let handle: String
    var owner: User
    var title: String
    var description: String
    var adminList: [(Privilege, User)]
    var voterList: [User]
    var interval: DateInterval?
    var voteList: [Vote]
    var voteItemList: [VoteItem]
    var voteType: VoteType
    
    init(owner: User, handle: String) {
        self.handle = handle
        self.owner = owner
        self.title = ""
        self.description = ""
        self.adminList = [(.owner, owner)]
        self.voterList = []
        self.interval = nil
        self.voteList = []
        self.voteItemList = []
        self.voteType = .Tournament
    }
}
