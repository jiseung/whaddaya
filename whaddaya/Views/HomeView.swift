//
//  HomeView.swift
//  whaddaya
//
//  Created by jiseung on 9/14/20.
//  Copyright © 2020 jiseung. All rights reserved.
//

import Foundation
import UIKit

class HomeView: UIView {
    let viewController: HomeViewController
    
    let createButton = Button(title: "Create", size: 30)
    let joinButton = Button(title: "Join", size: 30)
    let userLabel = UILabel()
    let userTextField = UITextField()
    
    let handleTextField = UITextField()
    let goButton = Button(title: "GO", size: 14)
    let alertLabel = UILabel()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(viewController: HomeViewController) {
        self.viewController = viewController
        super.init(frame: UIScreen.main.bounds)
        
        self.backgroundColor = .white
        
        self.addSubview(createButton)
        self.addSubview(joinButton)
        userLabel.text = "User: @"
        userLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(userLabel)
        userTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(userTextField)
        handleTextField.placeholder = "Room Code"
        handleTextField.font = UIFont.systemFont(ofSize: 20)
        handleTextField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(handleTextField)
        self.addSubview(goButton)
        alertLabel.textAlignment = .center
        alertLabel.textColor = .red
        alertLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(alertLabel)
        
        let constraints = [
            //createButton
            createButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            createButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -40),
            createButton.heightAnchor.constraint(lessThanOrEqualTo: self.heightAnchor, multiplier: 0.2),
            createButton.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 0.5),
            //joinButton
            joinButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            joinButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 40),
            joinButton.heightAnchor.constraint(lessThanOrEqualTo: self.heightAnchor, multiplier: 0.2),
            joinButton.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 0.5),
            //handleTextField
            handleTextField.topAnchor.constraint(equalTo: joinButton.bottomAnchor, constant: 10),
            handleTextField.centerXAnchor.constraint(equalTo: joinButton.centerXAnchor),
            handleTextField.heightAnchor.constraint(equalTo: joinButton.heightAnchor),
            handleTextField.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor, multiplier: 0.5),
            //goButton
            goButton.leftAnchor.constraint(equalTo: handleTextField.rightAnchor, constant: 5),
            goButton.centerYAnchor.constraint(equalTo: handleTextField.centerYAnchor),
            goButton.widthAnchor.constraint(equalToConstant: 30),
            goButton.heightAnchor.constraint(equalTo: handleTextField.heightAnchor),
            //userTextField
            userTextField.leftAnchor.constraint(equalTo: self.centerXAnchor),
            userTextField.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            userTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4),
            userTextField.heightAnchor.constraint(equalTo: handleTextField.heightAnchor),
            //userLabel
            userLabel.centerYAnchor.constraint(equalTo: userTextField.centerYAnchor),
            userLabel.rightAnchor.constraint(equalTo: userTextField.leftAnchor),
            userLabel.heightAnchor.constraint(equalTo: userTextField.heightAnchor),
            userLabel.widthAnchor.constraint(equalToConstant: 70),
            //alertLabel
            alertLabel.centerXAnchor.constraint(equalTo: handleTextField.centerXAnchor),
            alertLabel.topAnchor.constraint(equalTo: handleTextField.bottomAnchor),
            alertLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
            alertLabel.heightAnchor.constraint(equalTo: userTextField.heightAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
