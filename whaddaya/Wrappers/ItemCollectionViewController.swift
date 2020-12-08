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
        itemCollectionView.collectionView.delegate = self
        itemCollectionView.collectionView.dataSource = self
        itemCollectionView.collectionView.backgroundColor = .red
        itemCollectionView.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
        itemCollectionView.collectionView.reloadData()
        
        editItemView = EditItemView(viewController: self)
        
        super.viewDidLoad()
        self.view.addSubview(itemCollectionView)
        self.view.addSubview(editItemView)
        editItemView.isHidden = true
        
        itemCollectionView.backButton.addTarget(self, action: #selector(backTapped(_:)), for: .touchUpInside)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }
    
    @objc func backTapped(_ button: UIButton) {
        print("clicked on back")

        self.navigationController?.popViewController(animated: false)
    }
}

extension ItemCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //datasource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("hello")
        return 15
    }
    //datasource
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("hello1")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath)
        cell.backgroundColor = .green
        return cell
        
    }
    //delegateflowlayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("hello11")
        return CGSize(width: 5, height: 5)
    }
    //delegateflowlayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        print("hello111")
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
}
