//
//  LoginViewController.swift
//  miniproject
//
//  Created by Bakwan on 04/04/19.
//  Copyright © 2019 Bakwan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginOnClick(_ sender: Any) {
        let username = txtUsername.text
        let password = txtPassword.text
        
        let name = UserDefaults.standard.string(forKey: "username") ?? ""
        let pwd = UserDefaults.standard.string(forKey: "password") ?? ""
        
        if(name == username && password == pwd)
        {
             UserDefaults.standard.set(true, forKey: "isLogin")
            
            let alert = UIAlertController(title: "Information", message: "Login success", preferredStyle: UIAlertController.Style.alert)
            
            let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default){
                action in
                
                let main = ViewController()
                main.name = username ?? ""
                self.dismiss(animated: true, completion:nil)
            }
            
            alert.addAction(action);
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            let alert = UIAlertController(title: "Alert", message: "Invalid Username or Password", preferredStyle: UIAlertController.Style.alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "LoginView"){
            let displayVC = segue.destination as! ViewController
            displayVC.name = txtUsername.text!
        }
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
