//
//  Backend.swift
//  whaddaya
//
//  Created by jiseung on 9/17/20.
//  Copyright © 2020 jiseung. All rights reserved.
//

import Foundation

class Backend {
    enum BackendError: Error {
        case noMatchingRoom
    }
    
    var database: [Room]
    
    init() {
        self.database = []
    }
    
    func addRoom(room: Room) {
        self.database.append(room)
    }
    
    func removeRoom(room: Room) throws {
        for (i, r) in self.database.enumerated() {
            if r.handle == room.handle {
                self.database.remove(at: i)
            }
        }
        throw BackendError.noMatchingRoom
    }
    
    func searchRoom(handle: String) -> Room? {
        for r in self.database {
            if r.handle == handle {
                return r
            }
        }
        return nil
    }
}
