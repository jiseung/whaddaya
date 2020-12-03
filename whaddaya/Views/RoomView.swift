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
    let contactButton = Button(title: "Contact", size: 20)
    let titleTextField = UITextField()
    let descriptionTextView = UITextView()
    let voteListButton = Button(title: "Vote List", size: 20)
    let voteListPreviewButton = Button(title: "Preview Vote List", size: 20)
    let voteTypeButton = Button(title: "Vote Type", size: 20)
    let voteTypeLabel = UILabel()
    let voteButton = Button(title: "VOTE", size: 30)
    let publishButton = Button(title: "PUBLISH", size: 30)
    let voteStatement = UILabel()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(viewController: RoomViewController) {
        self.viewController = viewController
        super.init(frame: UIScreen.main.bounds)
        
        backgroundColor = .white
        
        addSubview(backButton)
        handleLabel.text = viewController.room.handle
        handleLabel.textColor = .purple
        handleLabel.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        handleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(handleLabel)
        addSubview(editButton)
        addSubview(contactButton)
        titleTextField.placeholder = "Title goes here"
        titleTextField.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleTextField)
        descriptionTextView.text = "Description goes here"
        descriptionTextView.textColor = .gray
        descriptionTextView.font = UIFont.systemFont(ofSize: 20)
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(descriptionTextView)
        addSubview(voteListButton)
        addSubview(voteListPreviewButton)
        addSubview(voteTypeButton)
        voteTypeLabel.text = "Vote type label" //TODO
        voteTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(voteTypeLabel)
        addSubview(voteButton)
        addSubview(publishButton)
        voteStatement.text = "Voting ends in ..."
        voteStatement.translatesAutoresizingMaskIntoConstraints = false
        addSubview(voteStatement)
        
        
        let width = bounds.size.width
        let height = bounds.size.height
        let constraints = [
            //backButton
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: width*0.05),
            backButton.topAnchor.constraint(equalTo: self.topAnchor, constant: height*0.05),
            backButton.widthAnchor.constraint(equalToConstant: backButton.intrinsicContentSize.width),
            backButton.heightAnchor.constraint(equalToConstant: backButton.intrinsicContentSize.height),
            //handleLabel
            handleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            handleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            handleLabel.widthAnchor.constraint(equalToConstant: handleLabel.intrinsicContentSize.width),
            handleLabel.heightAnchor.constraint(equalToConstant: handleLabel.intrinsicContentSize.height),
            //editButton
            editButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -width*0.05),
            editButton.topAnchor.constraint(equalTo: self.topAnchor, constant: height*0.05),
            editButton.widthAnchor.constraint(equalToConstant: editButton.intrinsicContentSize.width),
            editButton.heightAnchor.constraint(equalToConstant: editButton.intrinsicContentSize.height),
            //contactButton
            contactButton.rightAnchor.constraint(equalTo: editButton.rightAnchor),
            contactButton.topAnchor.constraint(equalTo: editButton.topAnchor),
            contactButton.widthAnchor.constraint(equalToConstant: contactButton.intrinsicContentSize.width),
            contactButton.heightAnchor.constraint(equalToConstant: contactButton.intrinsicContentSize.height),
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
            voteStatement.widthAnchor.constraint(equalToConstant: voteStatement.intrinsicContentSize.width),
            voteStatement.heightAnchor.constraint(equalToConstant: voteStatement.intrinsicContentSize.height),
            //voteButton
            voteButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            voteButton.topAnchor.constraint(equalTo: self.bottomAnchor, constant: -height*0.15),
            voteButton.widthAnchor.constraint(equalToConstant: voteButton.intrinsicContentSize.width),
            voteButton.heightAnchor.constraint(equalToConstant: voteButton.intrinsicContentSize.height),
            //publishButton
            publishButton.centerXAnchor.constraint(equalTo: voteButton.centerXAnchor),
            publishButton.centerYAnchor.constraint(equalTo: voteButton.centerYAnchor),
            publishButton.widthAnchor.constraint(equalToConstant: publishButton.intrinsicContentSize.width),
            publishButton.heightAnchor.constraint(equalToConstant: publishButton.intrinsicContentSize.height),
            //voteListButton
            voteListButton.bottomAnchor.constraint(equalTo: voteButton.topAnchor, constant: -height*0.15),
            voteListButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            voteListButton.widthAnchor.constraint(equalToConstant: voteListButton.intrinsicContentSize.width),
            voteListButton.heightAnchor.constraint(equalToConstant: voteListButton.intrinsicContentSize.height),
            //voteListPreviewButton
            voteListPreviewButton.centerXAnchor.constraint(equalTo: voteListButton.centerXAnchor),
            voteListPreviewButton.centerYAnchor.constraint(equalTo: voteListButton.centerYAnchor),
            voteListPreviewButton.widthAnchor.constraint(equalToConstant: voteListPreviewButton.intrinsicContentSize.width),
            voteListPreviewButton.heightAnchor.constraint(equalToConstant: voteListPreviewButton.intrinsicContentSize.height),
            //voteTypeButton
            voteTypeButton.centerXAnchor.constraint(equalTo: voteListButton.centerXAnchor),
            voteTypeButton.topAnchor.constraint(equalTo: voteListButton.bottomAnchor, constant: height*0.05),
            voteTypeButton.widthAnchor.constraint(equalToConstant: voteTypeButton.intrinsicContentSize.width),
            voteTypeButton.heightAnchor.constraint(equalToConstant: voteTypeButton.intrinsicContentSize.height),
            //voteTypeLabel
            voteTypeLabel.centerXAnchor.constraint(equalTo: voteTypeButton.centerXAnchor),
            voteTypeLabel.centerYAnchor.constraint(equalTo: voteTypeButton.centerYAnchor),
            voteTypeLabel.widthAnchor.constraint(equalToConstant: voteTypeLabel.intrinsicContentSize.width),
            voteTypeLabel.heightAnchor.constraint(equalToConstant: voteTypeLabel.intrinsicContentSize.height)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    
}
