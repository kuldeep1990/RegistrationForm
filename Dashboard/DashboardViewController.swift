//
//  DashboardViewController.swift
//  RegistrationForm
//
//  Created by KULDEP KUMAR PRAJAPATI on 02/08/20.
//  Copyright © 2020 KULDEP KUMAR PRAJAPATI. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var txtName: UILabel!
    var strName=""
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: true)
        txtName.text = strName
        
    }
    
    @IBAction func clickLogout(_ sender: UIBarButtonItem) {
        ApiManager.shareInstance.callingLogoutAPI()
        
    }
    
}

extension DashboardViewController{
    
    static func shareInstance() -> DashboardViewController{
        let storyboard = UIStoryboard(name: "Dashboard", bundle: nil)
        let deshboard = storyboard.instantiateViewController(withIdentifier: "\(Self.self)") as! DashboardViewController
        return deshboard
    }
    
}
