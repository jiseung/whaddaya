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
    
    var room: [Room]
    var user: [User]
    
    init() {
        self.room = []
        self.user = []
    }
    
    // Rooms
    func generateRoomHandle() -> String {
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var handle = Util.generateCode(numChar: 5, letters: letters)
        while searchRoom(handle: handle) != nil {
            handle = Util.generateCode(numChar: 5, letters: letters)
        }
        return handle
        
    }
    func addRoom(room: Room) {
        self.room.append(room)
        print("room added")
        print(room)
    }
    
    func removeRoom(room: Room) throws {
        for (i, r) in self.room.enumerated() {
            if r.handle == room.handle {
                self.room.remove(at: i)
            }
        }
        throw BackendError.noMatchingRoom
    }
    
    func searchRoom(handle: String) -> Room? {
        for r in self.room {
            if r.handle == handle {
                return r
            }
        }
        return nil
    }
    
    // Users
    func generateUserHandle() -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var handle = Util.generateCode(numChar: 8, letters: letters)
        while searchUser(handle: handle) != nil {
            handle = Util.generateCode(numChar: 8, letters: letters)
        }
        return handle
    }
    
    func addUser(user: User) {
        self.user.append(user)
        print("user added")
        print(user)
    }
    
    func searchUser(handle: String) -> User? {
        for u in self.user {
            if u.handle == handle {
                return u
            }
        }
        return nil
    }
}
