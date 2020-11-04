//
//  EditRoomView.swift
//  whaddaya
//
//  Created by jiseung on 9/17/20.
//  Copyright © 2020 jiseung. All rights reserved.
//

import Foundation
import UIKit

class EditRoomView: UIView {
    let viewController: RoomViewController
    
    let backButton = Button(title: "back", size: 20)
    let privilegeStatement = UILabel()
    let voteItemButton = Button(title: "Vote Items", size: 18)
    let peopleButton = Button(title: "People", size: 18)
    let unpublishButton = Button(title: "Unpublish Room", size: 18)
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(viewController: RoomViewController) {
        self.viewController = viewController
        super.init(frame: UIScreen.main.bounds)
        
        self.backgroundColor = .lightGray
        
        backButton.isHidden = true
        self.addSubview(backButton)
        privilegeStatement.isHidden = true
        privilegeStatement.font = UIFont.systemFont(ofSize: 14)
        privilegeStatement.textColor = .red
        privilegeStatement.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(privilegeStatement)
        self.addSubview(voteItemButton)
        self.addSubview(peopleButton)
        self.addSubview(unpublishButton)
        
        let width = self.bounds.size.width
        let height = self.bounds.size.height
        let constraints = [
            //backButton
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: width*0.05),
            backButton.topAnchor.constraint(equalTo: self.topAnchor, constant: height*0.05),
            backButton.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 0.2),
            backButton.heightAnchor.constraint(lessThanOrEqualTo: self.heightAnchor, multiplier: 0.2),
            //privilegeStatement
            privilegeStatement.leftAnchor.constraint(equalTo: backButton.rightAnchor, constant: 10),
            privilegeStatement.widthAnchor.constraint(equalToConstant: width*0.5),
            privilegeStatement.heightAnchor.constraint(lessThanOrEqualTo: self.heightAnchor, multiplier: 0.2),
            privilegeStatement.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            //voteItemButton
            voteItemButton.leftAnchor.constraint(equalTo: backButton.leftAnchor),
            voteItemButton.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 10),
            voteItemButton.widthAnchor.constraint(lessThanOrEqualToConstant: width*0.5),
            voteItemButton.heightAnchor.constraint(lessThanOrEqualTo: self.heightAnchor, multiplier: 0.2),
            //peopleButton
            peopleButton.leftAnchor.constraint(equalTo: voteItemButton.leftAnchor),
            peopleButton.topAnchor.constraint(equalTo: voteItemButton.bottomAnchor, constant: 10),
            peopleButton.widthAnchor.constraint(lessThanOrEqualToConstant: width*0.5),
            peopleButton.heightAnchor.constraint(lessThanOrEqualTo: self.heightAnchor, multiplier: 0.2),
            //unpublishButton
            unpublishButton.leftAnchor.constraint(equalTo: peopleButton.leftAnchor),
            unpublishButton.topAnchor.constraint(equalTo: peopleButton.bottomAnchor, constant: 10),
            unpublishButton.widthAnchor.constraint(equalToConstant: unpublishButton.intrinsicContentSize.width),
            unpublishButton.heightAnchor.constraint(equalToConstant: unpublishButton.intrinsicContentSize.height)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
