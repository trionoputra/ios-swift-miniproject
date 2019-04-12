//
//  ViewController.swift
//  miniproject
//
//  Created by Bakwan on 02/04/19.
//  Copyright © 2019 Bakwan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController,DisplayViewControllerDelegate,UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var lblUsername: UILabel!
    var name:String = ""
    var arrRes = [[String:AnyObject]]()
    @IBOutlet weak var tblJSON: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Alamofire.request("http://api.androidhive.info/contacts/").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                
                if let resData = swiftyJsonVar["contacts"].arrayObject {
                    self.arrRes = resData as! [[String:AnyObject]]
                }
                if self.arrRes.count > 0 {
                    self.tblJSON.reloadData()
                }
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "jsonCell")!
        var dict = arrRes[indexPath.row]
        cell.textLabel?.text = dict["name"] as? String
        cell.detailTextLabel?.text = dict["email"] as? String
       
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //getting the index path of selected row
       // let indexPath = tableView.indexPathForSelectedRow
    
        //getting the current cell from the index path
        let currentCell = tableView.cellForRow(at: indexPath)! as UITableViewCell
        
        //getting the text of that cell
        let title = currentCell.textLabel!.text
        let detail = currentCell.detailTextLabel!.text
        
        let detailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
        detailViewController.name = title ?? "";
        detailViewController.detail = detail ?? "";

        self.navigationController?.pushViewController(detailViewController, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrRes.count
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let isLogin = UserDefaults.standard.bool(forKey: "isLogin")
        if(!isLogin)
        {
          self.performSegue(withIdentifier: "LoginView", sender: self)
        }
        
        lblUsername.text = UserDefaults.standard.string(forKey: "username");
    }

    @IBAction func logout(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "isLogin")
        self.performSegue(withIdentifier: "LoginView", sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "DetailView"){
            let displayVC = segue.destination as! DetailViewController
            displayVC.name = lblUsername.text!
            displayVC.delegate = self
        }
    }
    
    
   
    func doSomethingWith(data: String) {
        print(data)
    }
    
    
    
}

