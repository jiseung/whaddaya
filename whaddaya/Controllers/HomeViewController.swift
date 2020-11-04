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
    var activeTextField: UITextField? = nil
    
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
        joinView.handleField.delegate = self
        joinView.roomTableView.delegate = self
        joinView.roomTableView.dataSource = self
        joinView.roomTableView.register(UITableViewCell.self, forCellReuseIdentifier: "roomCell")
        self.view.addSubview(joinView)
        
        homeView.createButton.addTarget(self, action: #selector(createTapped(_:)), for: .touchUpInside)
        homeView.joinButton.addTarget(self, action: #selector(joinTapped(_:)), for: .touchUpInside)
        joinView.goButton.addTarget(self, action: #selector(goTapped(_:)), for: .touchUpInside)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
        
        NotificationCenter.default.addObserver(self, selector: #selector(HomeViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(HomeViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
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
        createViewController.user = self.user
        createViewController.backend = self.backend
        self.navigationController?.pushViewController(createViewController, animated: false)
    }
    
    @objc func joinTapped(_ button: UIButton) {
        print("clicked on join")
        
        joinView.isHidden = false
        joinView.handleField.text = ""
        joinView.roomTableView.reloadData()
    }
    
    @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        self.view.endEditing(true)
        if joinView.isHidden == false {
            let tapPoint = gestureRecognizer.location(in: homeView)
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
    
    @objc func goTapped(_ button: UIButton) {
        print("clicked on go")
        
        if let handle = joinView.handleField.text {
            if let room = backend.searchRoom(handle: handle) {
                let roomViewController = RoomViewController()
                roomViewController.room = room
                roomViewController.user = user
                roomViewController.backend = backend
                navigationController?.pushViewController(roomViewController, animated: false)
            } else {
                print("Room not found")
            }
        } else {
            print("Invalid code")
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
           // if keyboard size is not available for some reason, dont do anything
           return
        }
        
        var shouldMoveViewUp = false
        
        if let activeTextField = activeTextField {
            let bottomOfTextField = activeTextField.convert(activeTextField.bounds, to: self.view).maxY;
            let topOfKeyboard = self.view.frame.height - keyboardSize.height
            shouldMoveViewUp = bottomOfTextField > topOfKeyboard
        }

        if (shouldMoveViewUp) {
            self.view.frame.origin.y = 0 - keyboardSize.height
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
      self.view.frame.origin.y = 0
    }
}

extension HomeViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == homeView.userTextField {
            print("func")
            if let handle = textField.text {
                if handle != self.user.handle {
                    print("new user: " + handle)
                    let user = User(handle: handle)
                    backend.addUser(user: user)
                    self.user = user
                }
            }
            homeView.userTextField.text = self.user.handle
        } else if textField == joinView.handleField {
            print("join handle text")
        }
        activeTextField = nil
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select row:")
        if let cellLabel = joinView.roomTableView.cellForRow(at: indexPath)?.textLabel?.text {
            joinView.handleField.text = cellLabel
            print(cellLabel)
        }
    }
}
