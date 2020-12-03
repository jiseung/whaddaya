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
    let viewController: ItemCollectionViewController
    
    let nameLabel = UILabel()
    let nameTextField = UITextField()
    let imageLabel = UILabel()
    let imageView = UIImageView()
    let descriptionLabel = UILabel()
    let descriptionTextView = UITextView()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(viewController: ItemCollectionViewController) {
        self.viewController = viewController
        super.init(frame: UIScreen.main.bounds)
        
        self.backgroundColor = .white
        
        //nameLabel
        nameLabel.text = "Name"
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameLabel)
        //nameTextField
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameTextField)
        //imageLabel
        imageLabel.text = "Image"
        imageLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageLabel)
        //imageView
        //placeholder image for imageview TODO
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        //descriptionLabel
        descriptionLabel.text = "Description"
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(descriptionLabel)
        //descriptionTextView
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(descriptionTextView)
        
        let width = self.bounds.size.width
        let height = self.bounds.size.height
        let hSpacing = height*0.05
        let constraints = [
            //nameLabel
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: hSpacing),
            nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: width*0.05),
            nameLabel.widthAnchor.constraint(equalToConstant: nameLabel.intrinsicContentSize.width),
            nameLabel.heightAnchor.constraint(equalToConstant: nameLabel.intrinsicContentSize.height),
            //nameTextField
            nameTextField.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            nameTextField.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: width*0.05),
            nameTextField.widthAnchor.constraint(equalToConstant: width*0.5),
            nameTextField.heightAnchor.constraint(equalTo: nameLabel.heightAnchor),
            //imageLabel
            imageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: hSpacing),
            imageLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor),
            imageLabel.widthAnchor.constraint(equalToConstant: imageLabel.intrinsicContentSize.width),
            imageLabel.heightAnchor.constraint(equalToConstant: imageLabel.intrinsicContentSize.height),
            //imageView
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: imageLabel.bottomAnchor, constant: hSpacing),
            imageView.widthAnchor.constraint(equalToConstant: width*0.5),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            //descriptionLabel
            descriptionLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: hSpacing),
            descriptionLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor),
            descriptionLabel.widthAnchor.constraint(equalToConstant: descriptionLabel.intrinsicContentSize.width),
            descriptionLabel.heightAnchor.constraint(equalToConstant: descriptionLabel.intrinsicContentSize.height),
            //descriptionTextView
            descriptionTextView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            descriptionTextView.widthAnchor.constraint(equalToConstant: width*0.7),
            descriptionTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: hSpacing),
            descriptionTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
