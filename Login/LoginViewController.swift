//
//  ViewController.swift
//  RegistrationForm
//
//  Created by KULDEP KUMAR PRAJAPATI on 01/08/20.
//  Copyright © 2020 KULDEP KUMAR PRAJAPATI. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if TokenService.tokenInstance.checkForLogin() {
            let dashboardVC = DashboardViewController.shareInstance()
            dashboardVC.strName = TokenService.tokenInstance.getName()
            self.navigationController?.pushViewController(dashboardVC, animated: true)
        }
        // Do any additional setup afte/Users/kuldeepkumar/Desktop/ios Projects/RegistrationForm/RegistrationFormr loading the view.
    }


    @IBAction func clickSignIn(_ sender: UIButton) {
        
        guard let strEmail = self.txtEmail.text else { return }
        guard let strPassword = self.txtPass.text else { return }
        
        if (strEmail.isEmpty && strEmail.isEmpty && strPassword.isEmpty) {
            Alert.showAlert(on: self, title: "Alert", message: "Please enter your login details")
            txtPass.becomeFirstResponder()
        }else if (strEmail.isEmpty) {
           txtEmail.becomeFirstResponder()
           Alert.showAlert(on: self, title: "Alert", message: "Please enter your email")
           return
        }else if (strPassword.isEmpty) {
           txtPass.becomeFirstResponder()
           Alert.showAlert(on: self, title: "Alert", message: "Please enter your password")
           return
        }else{
            let login = LoginModel(login: strEmail,password: strPassword)
            ApiManager.shareInstance.callingLoginApi(login: login) { (result) in
                switch result{
                case .success(let json):
                    print(json)
                    let email = (json as! ResponseModel).email
                    let name = (json as! ResponseModel).name
                    let token = (json as! ResponseModel).userToken
                    let modelResponse = LoginModelResponse(name: name, email: email)
                    TokenService.tokenInstance.saveToken(token: token)
                    TokenService.tokenInstance.saveName(name: name)
                    TokenService.tokenInstance.saveEmail(email: email)
                    
                    print(modelResponse)
                    let dashboardVC = DashboardViewController.shareInstance()
                    dashboardVC.strName = name
                    self.navigationController?.pushViewController(dashboardVC, animated: true)
                    
                    
                case .failure(let err):
                    print(err.localizedDescription)
                }
            }
        }
        
    }
    
    
    @IBAction func clickCreateAccount(_ sender: UIButton) {
        let registration = self.storyboard?.instantiateViewController(withIdentifier: "RegistrationViewController") as! RegistrationViewController
        registration.modalPresentationStyle = .fullScreen
        self.present(registration, animated: true, completion: nil)
    }
    
    
    
}


extension LoginViewController{
    
    static func shareInstance() -> LoginViewController{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let login = storyboard.instantiateViewController(withIdentifier: "\(Self.self)") as! LoginViewController
        return login
    }
    
}
