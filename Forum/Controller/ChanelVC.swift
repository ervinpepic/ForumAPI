//
//  ChanelVC.swift
//  Forum
//
//  Created by Ervin Pepic on 11/27/17.
//  Copyright © 2017 Ervin Pepic. All rights reserved.
//

import UIKit

class ChanelVC: UIViewController {

    
    //outlets
    @IBOutlet weak var loginBtn: UIButton!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    }
    
    //actions ib

    @IBAction func loginBtnPressed(_ sender: Any) {
        
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
        
    }
    
}
