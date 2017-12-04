//
//  LoginVC.swift
//  Forum
//
//  Created by Ervin Pepic on 11/27/17.
//  Copyright © 2017 Ervin Pepic. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    // Outlets
    
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var spinnerActivity: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        
        spinnerActivity.isHidden = false
        spinnerActivity.startAnimating()
        
        guard let email = userNameTxt.text , userNameTxt.text != "" else { return }
        guard let password = passwordTxt.text , passwordTxt.text != "" else { return }
        
        AuthService.instance.loginUser(email: email, password: password) { (success) in
            if success {
                
                AuthService.instance.findUserByEmail(completion: { (success) in
                    if success {
                        
                        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                        self.spinnerActivity .isHidden = true
                        self.spinnerActivity.stopAnimating()
                        self.dismiss(animated: true, completion: nil)
                    }
                })
                
            }
        }
        
    }
    
    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    @IBAction func createAccountBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
    func setupView() {
        
        spinnerActivity.isHidden = true
        userNameTxt.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedStringKey.foregroundColor: FORUMPURPPLEPLACEHOLDER])
        passwordTxt.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor: FORUMPURPPLEPLACEHOLDER])
        
        
    }
    
}
