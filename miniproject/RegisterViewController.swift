//
//  RegisterViewController.swift
//  miniproject
//
//  Created by Bakwan on 04/04/19.
//  Copyright © 2019 Bakwan. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtRetypePassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func RegisterOnClick(_ sender: Any) {
        let username = txtUsername.text
        let password = txtPassword.text
        let retypepassword = txtRetypePassword.text
        
        if(username?.isEmpty ?? false || password?.isEmpty ?? false || retypepassword?.isEmpty ?? false)
        {
            showAlert(message: "Field can't empty");
            return;
        }
        
        if(password != retypepassword)
        {
            showAlert(message: "Password doesn't match");
            return;
        }
        
        UserDefaults.standard.set(username, forKey: "username")
        UserDefaults.standard.set(password, forKey: "password")
        
        let alert = UIAlertController(title: "Information", message: "Registration success", preferredStyle: UIAlertController.Style.alert)
        
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default){
            action in
            self.dismiss(animated: true, completion:nil)
        }
        
        alert.addAction(action);
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlert(message:String)
    {
        
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func haveAccountOnClick(_ sender: Any) {
        self.dismiss(animated: true, completion:nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
