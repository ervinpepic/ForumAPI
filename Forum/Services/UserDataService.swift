//
//  UserDataService.swift
//  Forum
//
//  Created by Ervin Pepic on 12/1/17.
//  Copyright © 2017 Ervin Pepic. All rights reserved.
//

import Foundation

class UserDataService {
    
    static let instance = UserDataService()
    
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    func setUserData(id: String, color: String, avatarName: String, email: String, name: String) {
        
        self.id = id
        self.avatarColor = color
        self.avatarName = avatarName
        self.email = email
        self.name = name
        
    }
    
    func setAvatarName(avatarName: String) {
        
        self.avatarName = avatarName
        
    }
    
    func returnUIColor(components: String) -> UIColor {
        
//        "[0.447058823529412, 0.203921568627451, 0.2, 1]"
        
        let scanner = Scanner(string: components)
        let skipped = CharacterSet(charactersIn: "[], ")
        let comma = CharacterSet(charactersIn: ",")
        scanner.charactersToBeSkipped = skipped
        
        var r, g, b, a: NSString?
        
        scanner.scanUpToCharacters(from: comma, into: &r)
        scanner.scanUpToCharacters(from: comma, into: &g)
        scanner.scanUpToCharacters(from: comma, into: &b)
        scanner.scanUpToCharacters(from: comma, into: &a)
        
        let defaultColor = UIColor.lightGray
        
        guard let rUnwrapped =  r else { return defaultColor }
        guard let gUnwrapped =  g else { return defaultColor }
        guard let bUnwrapped =  b else { return defaultColor }
        guard let aUnwrapped =  a else { return defaultColor }
        
        let  rfloat = CGFloat(rUnwrapped.doubleValue)
        let  gfloat = CGFloat(gUnwrapped.doubleValue)
        let  bfloat = CGFloat(bUnwrapped.doubleValue)
        let  afloat = CGFloat(aUnwrapped.doubleValue)
        
        let newUICOlor = UIColor(red: rfloat, green: gfloat, blue: bfloat, alpha: afloat)
        
        return newUICOlor

    }
    
    func logoutUser() {
        
        id = ""
        avatarName = ""
        avatarColor = ""
        email = ""
        name = ""
        AuthService.instance.isLoggedIn = false
        AuthService.instance.userEmail = ""
        AuthService.instance.authToken = ""
        MessageService.instance.clearChannels()
        
    }

}
