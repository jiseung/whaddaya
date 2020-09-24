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
    let owner: String
    let adminList: [(Privilege, String)]
    let voterList: [String]
    let interval: DateInterval?
    let voteList: [Vote]
    let voteItemList: [VoteItem]
    
    init(owner: String) {
        handle = Util.generateCode(numChar: 5)
        self.owner = owner
        self.adminList = [(.owner, owner)]
        self.voterList = []
        self.interval = nil
        self.voteList = []
        self.voteItemList = []
    }
}
