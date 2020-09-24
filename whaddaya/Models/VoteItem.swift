//
//  VoteItem.swift
//  whaddaya
//
//  Created by jiseung on 9/17/20.
//  Copyright © 2020 jiseung. All rights reserved.
//

import Foundation
import UIKit

class VoteItem {
    let picture: UIImage?
    let nameLabel = UILabel()
    let shortDescTextField: UITextField?
    let longDescTextView: UITextView?
    
    init(name: String) {
        self.picture = nil
        self.nameLabel.text = name
        self.shortDescTextField = nil
        self.longDescTextView = nil
    }
}
