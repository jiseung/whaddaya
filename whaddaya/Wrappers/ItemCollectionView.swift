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
    let backButton = Button(title: "back", size: 20)
    
    let collectionView: UICollectionView
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(viewController: ItemCollectionViewController) {
        self.viewController = viewController
        
        let collectionLayout = UICollectionViewFlowLayout()
        self.collectionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: collectionLayout)
        
        super.init(frame: UIScreen.main.bounds)
        
        backgroundColor = .white
        
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        addSubview(addButton)
        addSubview(backButton)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        
        let width = bounds.size.width
        let height = bounds.size.height
        let constraints = [
            //titleLabel
            titleLabel.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0.05*height),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            //addButton
            addButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -width*0.05),
            addButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            addButton.widthAnchor.constraint(equalToConstant: addButton.intrinsicContentSize.width),
            addButton.heightAnchor.constraint(equalToConstant: addButton.intrinsicContentSize.height),
            //backButton
            backButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: width*0.05),
            backButton.centerYAnchor.constraint(equalTo: addButton.centerYAnchor),
            backButton.widthAnchor.constraint(equalToConstant: backButton.intrinsicContentSize.width),
            backButton.heightAnchor.constraint(equalToConstant: backButton.intrinsicContentSize.height),
            //collectionView
            collectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            collectionView.widthAnchor.constraint(equalTo: self.widthAnchor),
            collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0.1*height),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
