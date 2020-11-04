//
//  PopoverView.swift
//  whaddaya
//
//  Created by jiseung on 11/4/20.
//  Copyright © 2020 jiseung. All rights reserved.
//

import Foundation
import UIKit

class PopoverView: UIView {
    
    var superView: UIView!
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(superView: UIView) {
        self.superView = superView
        super.init(frame: UIScreen.main.bounds)
        
        self.backgroundColor = .white
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 3
        self.layer.cornerRadius = 30
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.5
        
        self.frame = CGRect(x: 0, y: 0, width: superView.bounds.width*0.8, height: superView.bounds.height*0.6)
        self.center = CGPoint(x: superView.frame.size.width/2, y: superView.frame.size.height/2)
        
        self.isHidden = true
    }
}
        
