//
//  Vote.swift
//  whaddaya
//
//  Created by jiseung on 9/17/20.
//  Copyright © 2020 jiseung. All rights reserved.
//

import Foundation

class Vote {
    let item: VoteItem
    let voter: String
    let say: Say
    
    init(item: VoteItem, voter: String, say: Say) {
        self.item = item
        self.voter = voter
        self.say = say
    }
}
