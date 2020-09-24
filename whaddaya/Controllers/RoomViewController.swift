//
//  RoomViewController.swift
//  whaddaya
//
//  Created by jiseung on 9/15/20.
//  Copyright © 2020 jiseung. All rights reserved.
//

import Foundation
import UIKit

class RoomViewController: UIViewController {
    
    var roomView: RoomView!
    var editView: EditRoomView!
    var room: Room!
    var user: String!
    
    var backend: Backend!
    
    override func viewDidLoad() {
        print("function reached")
        if self.room == nil {
            print(self.user)
            self.room = Room(owner: self.user)
            backend.addRoom(room: self.room)
        } else {
            print("room is not nil")
        }
        roomView = RoomView(viewController: self)
        editView = EditRoomView(viewController: self)
        super.viewDidLoad()
        self.view.addSubview(roomView)
        editView.frame = CGRect(x: self.view.bounds.width, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        self.view.addSubview(editView)
        
        roomView.backButton.addTarget(self, action: #selector(backTapped(_:)), for: .touchUpInside)
        roomView.editButton.addTarget(self, action: #selector(editTapped(_:)), for: .touchUpInside)
        editView.backButton.addTarget(self, action: #selector(backEditTapped(_:)), for: .touchUpInside)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (room.owner != user) {
            roomView.editButton.isHidden = true
            roomView.titleTextField.isUserInteractionEnabled = false
            roomView.descriptionTextView.isUserInteractionEnabled = false
        }
    }
    
    @objc func backTapped(_ button: UIButton) {
        print("clicked on back")

        self.navigationController?.popViewController(animated: false)
    }
    
    @objc func editTapped(_ button: UIButton) {
        print("clicked on edit")

        roomView.backButton.isHidden = true
        if user == room.owner {
            print("you are the owner")
            editView.privilegeStatement.isHidden = false
            editView.privilegeStatement.text = "You own this room"
        }
        print("you're not the owner")
        
        UIView.animate(withDuration: 0.3, animations: {
            self.editView.frame = CGRect(x: self.view.bounds.width*0.3, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        }, completion: { finished in
            print("finished")
            self.editView.backButton.isHidden = false
        })
    }
    
    @objc func backEditTapped(_ button: UIButton) {
        print("clicked on back on edit")

        self.roomView.backButton.isHidden = false
        
        UIView.animate(withDuration: 0.3, animations: {
            self.editView.frame = CGRect(x: self.view.bounds.width, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        }, completion: { finished in
            print("finished")
        })
    }
}
