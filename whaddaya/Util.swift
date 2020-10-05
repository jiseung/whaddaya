//
//  Util.swift
//  whaddaya
//
//  Created by jiseung on 9/16/20.
//  Copyright © 2020 jiseung. All rights reserved.
//

import Foundation

class Util {
    static func generateCode(numChar: Int, letters: String)  -> String {
        return String((0..<numChar).map{ _ in letters.randomElement()! })
    }
}
