//
//  AvatarCell.swift
//  Forum
//
//  Created by Ervin Pepic on 12/2/17.
//  Copyright © 2017 Ervin Pepic. All rights reserved.
//

import UIKit

class AvatarCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImg: UIImageView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        setupView()
        
    }
    
    func setupView() {
        
        self.layer.backgroundColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
}
