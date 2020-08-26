//
//  RegistrationViewController.swift
//  RegistrationForm
//
//  Created by KULDEP KUMAR PRAJAPATI on 01/08/20.
//  Copyright © 2020 KULDEP KUMAR PRAJAPATI. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var txtConPassword: UITextField!
    var validation = Validation()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func clickRegistration(_ sender: UIButton) {
        
        guard let strFirstName = self.txtName.text else { return }
        guard let strEmail = self.txtEmail.text else { return }
        guard let strPassword = self.txtPassword.text else { return }
        guard let strConPassword = self.txtConPassword.text else { return }
        
        
        if (strFirstName.isEmpty && strEmail.isEmpty && strPassword.isEmpty && strConPassword.isEmpty) {
            Alert.showAlert(on: self, title: "Alert", message: "All fields required")
            return
        }
         else if (strFirstName.isEmpty) {
            txtName.becomeFirstResponder()
            Alert.showAlert(on: self, title: "Alert", message: "Please enter First Name")
            return
         }else if(validation.validateName(name: strFirstName) == false){
            txtEmail.becomeFirstResponder()
            Alert.showAlert(on: self, title: "Alert", message: "Please enter name minimum 3 character")
            return
        }else if(strEmail.isEmpty){
            txtEmail.becomeFirstResponder()
            Alert.showAlert(on: self, title: "Alert", message: "Please enter Email")
            return
        }else if(validation.validateEmailId(emailID: strEmail) == false){
            txtEmail.becomeFirstResponder()
            Alert.showAlert(on: self, title: "Alert", message: "Please enter correct Email")
            return
        }else if(strPassword.isEmpty){
            txtPassword.becomeFirstResponder()
            Alert.showAlert(on: self, title: "Alert", message: "Please enter Password")
            return
        }else if(validation.validatePassword(password: strPassword) == false){
            txtPassword.becomeFirstResponder()
            Alert.showAlert(on: self, title: "Alert", message: "password should be 8 characters at least 1 Alphabet and 1 Number")
            return
        }else if(strConPassword.isEmpty){
            txtConPassword.becomeFirstResponder()
            Alert.showAlert(on: self, title: "Alert", message: "Please enter confirm Password")
            return
         }
        else if ((strConPassword == strPassword) == false){
            
            Alert.showAlert(on: self, title: "Alert", message: "Password does not match")
            return
        }else{
            let register = RegisterModel(name: strFirstName, email: strEmail, password: strPassword)
            ApiManager.shareInstance.callingRegistrationApi(register: register)
            { (isSuccess, message) in
                if isSuccess{
                Alert.showAlert(on: self, title: "Alert", message: message)
                }else{
                    Alert.showAlert(on: self, title: "Alert", message: message)
                }
            }
            return
        }

        
        
    }
    
    @IBAction func haveAnAccount(_ sender: UIButton) {
        let login = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        login.modalPresentationStyle = .fullScreen
        self.present(login, animated: true, completion: nil)
    }
}
