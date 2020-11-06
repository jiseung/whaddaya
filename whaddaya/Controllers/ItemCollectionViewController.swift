//
//  ItemCollectionViewController.swift
//  whaddaya
//
//  Created by jiseung on 10/5/20.
//  Copyright © 2020 jiseung. All rights reserved.
//

import Foundation
import UIKit

class ItemCollectionViewController: UIViewController {

    var itemCollectionView: ItemCollectionView!
    var editItemView: EditItemView!

    override func viewDidLoad() {
        
        itemCollectionView = ItemCollectionView(viewController: self)
        editItemView = EditItemView(viewController: self)
        
        super.viewDidLoad()
        self.view.addSubview(itemCollectionView)
        self.view.addSubview(editItemView)
        editItemView.isHidden = true
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
