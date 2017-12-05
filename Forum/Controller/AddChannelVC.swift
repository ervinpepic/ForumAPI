//
//  AddChannelVC.swift
//  Forum
//
//  Created by Ervin Pepic on 12/5/17.
//  Copyright © 2017 Ervin Pepic. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {

//Outlets connects
    
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var descChannel: UITextField!
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    
//IBActions


    @IBAction func closeModalPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func createChannelPressed(_ sender: Any) {
        
        

    }
    
    func setupView() {
        
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.closeTap(_:)))
        
        bgView.addGestureRecognizer(closeTouch)
        
        nameTxt.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedStringKey.foregroundColor: FORUMPURPPLEPLACEHOLDER])
        
        descChannel.attributedPlaceholder = NSAttributedString(string: "description", attributes: [NSAttributedStringKey.foregroundColor: FORUMPURPPLEPLACEHOLDER])
        
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        
        dismiss(animated: true, completion: nil)
        
    }

}
