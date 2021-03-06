//
//  JoinView.swift
//  whaddaya
//
//  Created by jiseung on 9/24/20.
//  Copyright © 2020 jiseung. All rights reserved.
//

import Foundation
import UIKit

class JoinView: PopoverView {
    let viewController: HomeViewController
    
    let handleField = UITextField()
    let goButton = Button(title: "GO", size: 20)
    
    let roomTableView = UITableView()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(viewController: HomeViewController) {
        self.viewController = viewController
        super.init(superView: viewController.view)
    
        handleField.placeholder = "Search/Join"
        handleField.font = UIFont.systemFont(ofSize: 20)
        handleField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(handleField)
        addSubview(goButton)
        roomTableView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(roomTableView)
        
        let width = bounds.size.width
        let height = bounds.size.height
        let constraints = [
            //handleField
            handleField.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            handleField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: width*0.05),
            handleField.widthAnchor.constraint(equalToConstant: width*0.6),
            handleField.heightAnchor.constraint(equalToConstant: handleField.intrinsicContentSize.height),
            //goButton
            goButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -width*0.05),
            goButton.centerYAnchor.constraint(equalTo: handleField.centerYAnchor),
            goButton.widthAnchor.constraint(equalToConstant: goButton.intrinsicContentSize.width),
            goButton.heightAnchor.constraint(equalToConstant: goButton.intrinsicContentSize.height),
            //roomTableView
            roomTableView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            roomTableView.widthAnchor.constraint(equalToConstant: width*0.7),
            roomTableView.topAnchor.constraint(equalTo: handleField.bottomAnchor, constant: 20),
            roomTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
