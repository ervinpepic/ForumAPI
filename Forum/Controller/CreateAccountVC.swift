//
//  CreateAccountVC.swift
//  Forum
//
//  Created by Ervin Pepic on 11/27/17.
//  Copyright © 2017 Ervin Pepic. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    


}
