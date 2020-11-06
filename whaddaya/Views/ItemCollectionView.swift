//
//  ItemCollectionView.swift
//  whaddaya
//
//  Created by jiseung on 10/5/20.
//  Copyright © 2020 jiseung. All rights reserved.
//

import Foundation
import UIKit

class ItemCollectionView: UICollectionView {
    let viewController: ItemCollectionViewController
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(viewController: ItemCollectionViewController) {
        self.viewController = viewController
        let layout = UICollectionViewLayout()
        super.init(frame: UIScreen.main.bounds, collectionViewLayout: layout)
    }
}
