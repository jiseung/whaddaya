//
//  ContactView.swift
//  whaddaya
//
//  Created by jiseung on 11/4/20.
//  Copyright © 2020 jiseung. All rights reserved.
//

import Foundation
import UIKit

class ContactView: PopoverView {
    let viewController: RoomViewController
    
    let toLabel = UILabel()
    let toTextField = UITextField()
    let messageTextView = UITextView()
    let sendButton = Button(title: "SEND", size: 30)
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(viewController: RoomViewController) {
        self.viewController = viewController
        super.init(superView: viewController.view)
    }
}
