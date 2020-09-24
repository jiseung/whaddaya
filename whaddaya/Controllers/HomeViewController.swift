//
//  ViewController.swift
//  whaddaya
//
//  Created by jiseung on 5/19/19.
//  Copyright © 2019 jiseung. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var homeView: HomeView!
    var user: String!
    
    var backend: Backend //firebase

    override func viewDidLoad() {
        homeView = HomeView(viewController: self)
        user = Util.generateCode(numChar: 10)
        homeView.userTextField.text = user
        homeView.userTextField.delegate = self
        homeView.handleTextField.delegate = self
        super.viewDidLoad()
        self.view.addSubview(homeView)
        
        homeView.createButton.addTarget(self, action: #selector(createTapped(_:)), for: .touchUpInside)
        homeView.joinButton.addTarget(self, action: #selector(joinTapped(_:)), for: .touchUpInside)
        homeView.goButton.addTarget(self, action: #selector(goTapped(_:)), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        self.backend = Backend() //firebase
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.homeView.handleTextField.isHidden = true
        self.homeView.goButton.isHidden = true
        self.homeView.alertLabel.isHidden = true
    }
    
    @objc func createTapped(_ button: UIButton) {
        print("clicked on create")

        let createViewController = RoomViewController()
        createViewController.user = self.user
        createViewController.backend = self.backend
        self.navigationController?.pushViewController(createViewController, animated: false)
    }
    
    @objc func joinTapped(_ button: UIButton) {
        print("clicked on join")
        
        self.homeView.handleTextField.isHidden = false
        self.homeView.goButton.isHidden = false
    }
    
    @objc func goTapped(_ button: UIButton) {
        print("clicked on go")
        
        let roomViewController = RoomViewController()
        roomViewController.user = self.user
        if let view = self.homeView {
            if let text = view.handleTextField.text {
                let search = backend.searchRoom(handle: text)
                if let room = search {
                    roomViewController.room = room
                    self.navigationController?.pushViewController(roomViewController, animated: false)
                } else  {
                    print("room doesn't exist")
                    self.homeView.alertLabel.text = "Alert: Room does not exist"
                    self.homeView.alertLabel.isHidden = false
                }
            } //text doesn't exit yet
        } //view doesn't exist yet
    }
}

extension HomeViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == homeView.userTextField {
            print("func")
            self.user = textField.text
            homeView.userTextField.text = self.user
        } else if textField == homeView.handleTextField {
            print("function")
            self.homeView.alertLabel.isHidden = true
        }
        //TODO: blinking cursor won't go away (firstresponder, endediting)?
    }
}
