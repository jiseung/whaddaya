//
//  ItemView.swift
//  whaddaya
//
//  Created by jiseung on 10/5/20.
//  Copyright © 2020 jiseung. All rights reserved.
//

import Foundation
import UIKit

class ItemView: UIView {
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
    }
}
