//
//  Button.swift
//  whaddaya
//
//  Created by jiseung on 9/15/20.
//  Copyright © 2020 jiseung. All rights reserved.
//

import Foundation
import UIKit

class Button: UIButton {
    init(title: String, size: CGFloat) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(.blue, for: .normal)
        let font = UIFont.systemFont(ofSize: size)
        self.titleLabel?.font = font
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
