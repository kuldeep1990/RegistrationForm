//
//  LoginModel.swift
//  RegistrationForm
//
//  Created by KULDEP KUMAR PRAJAPATI on 02/08/20.
//  Copyright © 2020 KULDEP KUMAR PRAJAPATI. All rights reserved.
//

import Foundation
import UIKit

struct LoginModel : Encodable{
    let login: String
    let password: String
}

struct LoginModelResponse {
    let name: String
    let email: String 
    
}
