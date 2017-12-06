//
//  ChatVC.swift
//  Forum
//
//  Created by Ervin Pepic on 11/27/17.
//  Copyright © 2017 Ervin Pepic. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    
    //outlets
    @IBOutlet weak var menuBtn: UIButton!
    
    @IBOutlet weak var channelnameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menuBtn.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.userDataDitChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.channelSelected(_:)), name: NOTIF_CHANNELS_SELECTED, object: nil)
        
        if AuthService.instance.isLoggedIn {
            
            AuthService.instance.findUserByEmail(completion: { (success) in
                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
            })
        }
        
    }
    
    @objc func userDataDitChange(_ notif: Notification) {
        
        if AuthService.instance.isLoggedIn {
            
            onLoginGetMessages()
            
        }
        
        else {
            
            channelnameLabel.text = "Please Login"
            
        }
        
    }
    
    @objc func channelSelected(_ notif: Notification) {
        
        updateWithChannel()
        
    }
    
    func updateWithChannel() {
        
        let channelName = MessageService.instance.selectedChannel?.channelTitle ?? ""
        channelnameLabel.text = "#\(channelName)"
        
    }
    
    
    func onLoginGetMessages() {
        
        MessageService.instance.findAllChannels { (success) in
            
            if success {
                
                //channels operation
            }
            
        }
        
    }


}
