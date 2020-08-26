//
//  Alert.swift
//  RegistrationForm
//
//  Created by KULDEP KUMAR PRAJAPATI on 01/08/20.
//  Copyright © 2020 KULDEP KUMAR PRAJAPATI. All rights reserved.
//

import Foundation
import  UIKit

struct Alert {
    static func showAlert(on vc: UIViewController, title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        DispatchQueue.main.async {
            vc.present(alert, animated: true)
        }
    }
}

