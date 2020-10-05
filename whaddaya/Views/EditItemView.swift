//
//  EditItemView.swift
//  whaddaya
//
//  Created by jiseung on 9/29/20.
//  Copyright © 2020 jiseung. All rights reserved.
//

import Foundation
import UIKit

class EditItemView: UIView {
    let viewController: ItemViewController
    
    let handleField = UITextField()
    let goButton = Button(title: "GO", size: 20)
    
    let roomTableView = UITableView()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(viewController: ItemViewController) {
        self.viewController = viewController
        super.init(frame: UIScreen.main.bounds)
        
        self.backgroundColor = .white
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 3
        self.layer.cornerRadius = 30
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.5
    }
}
