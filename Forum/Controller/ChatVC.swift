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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menuBtn.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        if AuthService.instance.isLoggedIn {
            
            AuthService.instance.findUserByEmail(completion: { (success) in
                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
            })
        }
        
        MessageService.instance.findAllChannels { (success) in
            
        }
        
    }
    
    


}
