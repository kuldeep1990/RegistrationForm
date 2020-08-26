//
//  TokenService.swift
//  RegistrationForm
//
//  Created by KULDEP KUMAR PRAJAPATI on 03/08/20.
//  Copyright © 2020 KULDEP KUMAR PRAJAPATI. All rights reserved.
//

import Foundation
import UIKit

class TokenService{
    static let tokenInstance = TokenService()
    let userDefault = UserDefaults.standard
    
    func saveToken(token: String) {
        userDefault.set(token, forKey: TokenKey.userLogin)
    }
    
    func getToken() -> String {
        if let token = userDefault.object(forKey: TokenKey.userLogin) as? String {
            return token
        }else{
        return ""
        }
    }
    
    func saveName(name: String) {
        userDefault.set(name, forKey: TokenKey.userName)
    }
    
    func getName() -> String {
        if let name = userDefault.object(forKey: TokenKey.userName) as? String {
            return name
        }else{
        return ""
        }
    }
    
    
    func saveEmail(email: String) {
        userDefault.set(email, forKey: TokenKey.userEmail)
    }
    
    func getEmail() -> String {
        if let email = userDefault.object(forKey: TokenKey.userEmail) as? String {
            return email
        }else{
        return ""
        }
    }
    
    
    func checkForLogin() -> Bool {
        if getToken() == ""{
            return false
        }else{
            return true
        }
    }
    
    
    func removeToken() {
        userDefault.removeObject(forKey: TokenKey.userLogin)
    }
    
    
}
