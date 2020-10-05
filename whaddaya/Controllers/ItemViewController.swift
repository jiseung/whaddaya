//
//  ItemViewController.swift
//  whaddaya
//
//  Created by jiseung on 10/5/20.
//  Copyright © 2020 jiseung. All rights reserved.
//

import Foundation
import UIKit

class ItemViewController: UIViewController {

    var itemView: ItemView!
    var editItemView: EditItemView!


    override func viewDidLoad() {
        
        itemView = ItemView(viewController: self)
        editItemView = EditItemView(viewController: self)
        
        super.viewDidLoad()
        self.view.addSubview(itemView)
        self.view.addSubview(editItemView)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
}
