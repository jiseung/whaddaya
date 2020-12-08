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
    var contactView: ContactView!
    var room: Room!
    var user: User!
    
    var backend: Backend!
    
    override func viewDidLoad() {
        print("function reached")
        if self.room == nil {
            print(self.user)
            self.room = Room(owner: self.user, handle: backend.generateRoomHandle())
        } else {
            print("room is not nil")
        }
        roomView = RoomView(viewController: self)
        editView = EditRoomView(viewController: self)
        super.viewDidLoad()
        roomView.titleTextField.delegate = self
        roomView.descriptionTextView.delegate = self
        self.view.addSubview(roomView)
        
        editView.frame = CGRect(x: self.view.bounds.width, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        self.view.addSubview(editView)
        
        contactView = ContactView(viewController: self)
        self.view.addSubview(contactView)
        
        roomView.backButton.addTarget(self, action: #selector(backTapped(_:)), for: .touchUpInside)
        roomView.editButton.addTarget(self, action: #selector(editTapped(_:)), for: .touchUpInside)
        roomView.contactButton.addTarget(self, action: #selector(contactTapped(_:)), for: .touchUpInside)
        roomView.voteListButton.addTarget(self, action: #selector(voteListTapped(_:)), for: .touchUpInside)
        roomView.voteTypeButton.addTarget(self, action: #selector(voteTypeTapped(_:)), for: .touchUpInside)
        roomView.publishButton.addTarget(self, action: #selector(publishTapped(_:)), for: .touchUpInside)
        roomView.voteButton.addTarget(self, action: #selector(voteTapped(_:)), for: .touchUpInside)
        editView.backButton.addTarget(self, action: #selector(backEditTapped(_:)), for: .touchUpInside)
        editView.unpublishButton.addTarget(self, action: #selector(unpublishTapped(_:)), for: .touchUpInside)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if (room.owner.handle != user.handle) {
            //user
            roomView.editButton.isHidden = true
            roomView.publishButton.isHidden = true
            roomView.voteListButton.isHidden = true
            roomView.titleTextField.isUserInteractionEnabled = false
            roomView.descriptionTextView.isUserInteractionEnabled = false
            roomView.voteTypeButton.isHidden = true
        } else {
            //owner
            roomView.contactButton.isHidden = true
            roomView.voteListPreviewButton.isHidden = true
            roomView.voteTypeLabel.isHidden = true
            
            if (backend.searchRoom(handle: room.handle) != nil) {
                //room is already published
                roomView.publishButton.isHidden = true
            } else  {
                roomView.voteButton.isHidden = true
            }
        }
        roomView.titleTextField.text = room.title
        if let text = roomView.descriptionTextView.text {
            roomView.descriptionTextView.text = text
        }
    }
    
    @objc func backTapped(_ button: UIButton) {
        print("clicked on back")

        self.navigationController?.popViewController(animated: false)
    }
    
    @objc func editTapped(_ button: UIButton) {
        print("clicked on edit")

        roomView.backButton.isHidden = true
        if user.handle == room.owner.handle {
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
    
    @objc func contactTapped(_ button: UIButton) {
        print("clicked on contact")
        
        contactView.isHidden = false
    }
    
    @objc func voteListTapped(_ button: UIButton) {
        print("clicked on votelist")
        
        let voteListViewController = VoteListViewController()
        self.navigationController?.pushViewController(voteListViewController, animated: false)
    }
    
    @objc func voteTypeTapped(_ button: UIButton) {
        print("clicked on votetype")
        //todo
    }
    
    @objc func publishTapped(_ button: UIButton) {
        print("clicked on publish")
        
        if let title = roomView.titleTextField.text {
            room.title = title
            print(title)
        }
        
        if let desc = roomView.descriptionTextView.text {
            room.description = desc
            print(desc)
        }
        backend.addRoom(room: room)
        self.navigationController?.popViewController(animated: false)
    }
    
    @objc func voteTapped(_ button: UIButton) {
        print("clicked on vote")
        
        let voteViewController = VoteViewController()
        self.navigationController?.pushViewController(voteViewController, animated: false)
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
    
    @objc func unpublishTapped(_ button: UIButton) {
        print("clicked on unpublish on edit")
        
        do {
            try backend.removeRoom(room: room)
        } catch {
            print("room not found")
        }
        self.navigationController?.popViewController(animated: false)
    }
}

extension RoomViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension RoomViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Description goes here" {
            textView.textColor = .black
            textView.text = ""
        }
    }
    
    func  textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == ""  {
            textView.textColor = .gray
            textView.text = "Description goes here"
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            if textView.text.suffix(2) == "\n\n" {
                print("matches")
                textView.text = textView.text.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
                textView.resignFirstResponder()
                return false
            }
        }
        return true
    }
}
