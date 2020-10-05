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
    var joinView: JoinView!
    var user: User!
    
    var backend: Backend //firebase

    override func viewDidLoad() {
        homeView = HomeView(viewController: self)
        let userHandle = backend.generateUserHandle()
        user = User(handle: userHandle)
        backend.addUser(user: user)
        homeView.userTextField.text = userHandle
        homeView.userTextField.delegate = self
        super.viewDidLoad()
        self.view.addSubview(homeView)
        
        joinView = JoinView(viewController: self)
        joinView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width*0.8, height: self.view.bounds.height*0.6)
        joinView.center = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height/2)
        joinView.handleField.delegate = self
        joinView.roomTableView.dataSource = self
        joinView.roomTableView.register(UITableViewCell.self, forCellReuseIdentifier: "roomCell")
        self.view.addSubview(joinView)
        joinView.isHidden = true
        
        homeView.createButton.addTarget(self, action: #selector(createTapped(_:)), for: .touchUpInside)
        homeView.joinButton.addTarget(self, action: #selector(joinTapped(_:)), for: .touchUpInside)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapRecognizer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        self.backend = Backend() //firebase
        super.init(nibName: nil, bundle: nil)
    }
    
    @objc func createTapped(_ button: UIButton) {
        print("clicked on create")

        let createViewController = RoomViewController()
        createViewController.user = self.user.handle
        createViewController.backend = self.backend
        self.navigationController?.pushViewController(createViewController, animated: false)
    }
    
    @objc func joinTapped(_ button: UIButton) {
        print("clicked on join")
        
        joinView.isHidden = false
        joinView.roomTableView.reloadData()
    }
    
    @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        print("tap working")
        
        if joinView.isHidden == false {
            let tapPoint = gestureRecognizer.location(in: homeView)
            print(gestureRecognizer.location(in: homeView))
            let xmin = joinView.frame.minX
            let xmax = joinView.frame.maxX
            let ymin = joinView.frame.minY
            let ymax = joinView.frame.maxY
            let inside = tapPoint.x >= xmin && tapPoint.x <= xmax && tapPoint.y >= ymin && tapPoint.y <= ymax
            if !inside {
                joinView.isHidden = true
            }
        }
    }
}

extension HomeViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == homeView.userTextField {
            print("func")
            self.user.handle = textField.text!
            homeView.userTextField.text = self.user.handle
            print("new user")
            print(self.user)
        } else if textField == joinView.handleField {
            print("join handle text")
        }
        //TODO: blinking cursor won't go away (firstresponder, endediting)?
    }
}

extension HomeViewController: UITableViewDataSource {  //, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "roomCell", for: indexPath)
        cell.textLabel?.text = backend.room[indexPath.row].handle
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("room count:")
        print(backend.room.count)
        return backend.room.count
    }
}
