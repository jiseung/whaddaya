//
//  VoteViewController.swift
//  whaddaya
//
//  Created by jiseung on 10/9/20.
//  Copyright © 2020 jiseung. All rights reserved.
//

import Foundation
import UIKit

class VoteViewController: UIViewController {

    var voteView: VoteView!

    override func viewDidLoad() {
        voteView = VoteView(viewController: self)
        
        super.viewDidLoad()
        self.view.addSubview(voteView)
    }
        
    init() {
        super.init(nibName: nil, bundle: nil)
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
