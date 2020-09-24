//
//  NavigationViewController.swift
//  whaddaya
//
//  Created by jiseung on 9/15/20.
//  Copyright © 2020 jiseung. All rights reserved.
//

import Foundation
import UIKit

class NavigationViewController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.isNavigationBarHidden = true
        let homeViewController = HomeViewController()
        self.pushViewController(homeViewController, animated: false)
    }
}
