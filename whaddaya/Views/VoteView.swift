//
//  VoteView.swift
//  whaddaya
//
//  Created by jiseung on 10/9/20.
//  Copyright © 2020 jiseung. All rights reserved.
//

import Foundation
import UIKit

class VoteView: UIView {
    let viewController: VoteViewController
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(viewController: VoteViewController) {
        self.viewController = viewController
        super.init(frame: UIScreen.main.bounds)
        
        backgroundColor = .white
    }
}
