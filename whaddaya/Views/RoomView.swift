//
//  RoomView.swift
//  whaddaya
//
//  Created by jiseung on 9/15/20.
//  Copyright © 2020 jiseung. All rights reserved.
//

import Foundation
import UIKit

class RoomView: UIView {
    let viewController: RoomViewController
    
    let backButton = Button(title: "back", size: 20)
    let handleLabel = UILabel()
    let editButton = Button(title: "edit", size: 20)
    let titleTextField = UITextField()
    let descriptionTextView = UITextView()
    let voteButton = Button(title: "VOTE", size: 30)
    let voteStatement = UILabel()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(viewController: RoomViewController) {
        self.viewController = viewController
        super.init(frame: UIScreen.main.bounds)
        
        self.backgroundColor = .white
        
        self.addSubview(backButton)
        handleLabel.text = viewController.room.handle
        handleLabel.textColor = .purple
        handleLabel.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        handleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(handleLabel)
        self.addSubview(editButton)
        titleTextField.placeholder = "Title goes here"
        titleTextField.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleTextField)
        descriptionTextView.text = "Description goes here"
        descriptionTextView.textColor = .gray
        descriptionTextView.font = UIFont.systemFont(ofSize: 20)
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(descriptionTextView)
        self.addSubview(voteButton)
        voteStatement.text = "Voting ends in ..."
        voteStatement.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(voteStatement)
        
        
        let width = self.bounds.size.width
        let height = self.bounds.size.height
        let constraints = [
            //backButton
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: width*0.05),
            backButton.topAnchor.constraint(equalTo: self.topAnchor, constant: height*0.05),
            backButton.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 0.2),
            backButton.heightAnchor.constraint(lessThanOrEqualTo: self.heightAnchor, multiplier: 0.2),
            //handleLabel
            handleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            handleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            handleLabel.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 0.8),
            handleLabel.heightAnchor.constraint(lessThanOrEqualTo: self.heightAnchor, multiplier: 0.2),
            //editButton
            editButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -width*0.05),
            editButton.topAnchor.constraint(equalTo: self.topAnchor, constant: height*0.05),
            editButton.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 0.2),
            editButton.heightAnchor.constraint(lessThanOrEqualTo: self.heightAnchor, multiplier: 0.2),
            //titleTextField
            titleTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleTextField.topAnchor.constraint(equalTo: handleLabel.bottomAnchor, constant: 10),
            titleTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            titleTextField.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.05, constant: 30),
            //descriptionTextView
            descriptionTextView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            descriptionTextView.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 10),
            descriptionTextView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            descriptionTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -150),
            //voteStatement
            voteStatement.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            voteStatement.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor),
            voteStatement.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 0.9),
            voteStatement.heightAnchor.constraint(lessThanOrEqualTo: self.heightAnchor, multiplier: 0.05),
            //voteButton
            voteButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            voteButton.topAnchor.constraint(equalTo: self.bottomAnchor, constant: -height*0.15),
            voteButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4),
            voteButton.bottomAnchor.constraint(equalTo: voteStatement.topAnchor, constant: -5)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    
}
