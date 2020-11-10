//
//  ItemCollectionView.swift
//  whaddaya
//
//  Created by jiseung on 10/5/20.
//  Copyright © 2020 jiseung. All rights reserved.
//

import Foundation
import UIKit

class ItemCollectionView: UIView {
    let viewController: ItemCollectionViewController
    
    let titleLabel = UILabel()
    let addButton = Button(title: "add", size: 20)
    
    let collectionView: UICollectionView
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(viewController: ItemCollectionViewController) {
        self.viewController = viewController
        
        let collectionLayout = UICollectionViewFlowLayout()
        self.collectionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: collectionLayout)
        
        super.init(frame: UIScreen.main.bounds)
        
        self.backgroundColor = .white
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
        self.addSubview(addButton)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(collectionView)
        
        let width = self.bounds.size.width
        let height = self.bounds.size.height
        let constraints = [
            //titleLabel
            titleLabel.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0.05*height),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: titleLabel.intrinsicContentSize.width),
            titleLabel.heightAnchor.constraint(equalToConstant: titleLabel.intrinsicContentSize.height),
            //addButton
            addButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -width*0.05),
            addButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            addButton.widthAnchor.constraint(equalToConstant: addButton.intrinsicContentSize.width),
            addButton.heightAnchor.constraint(equalToConstant: addButton.intrinsicContentSize.height),
            //collectionView
            collectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            collectionView.widthAnchor.constraint(equalTo: self.widthAnchor),
            collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0.1*height),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
