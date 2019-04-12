//
//  DetailViewController.swift
//  miniproject
//
//  Created by Bakwan on 04/04/19.
//  Copyright © 2019 Bakwan. All rights reserved.
//

import UIKit


protocol DisplayViewControllerDelegate : NSObjectProtocol{
    func doSomethingWith(data: String)
}

class DetailViewController: UIViewController {

    @IBOutlet weak var txtusername: UILabel!
    var name:String = ""
    var detail:String = ""
    weak var delegate : DisplayViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        txtusername.text = self.detail;
        self.navigationItem.title = name;
        
        
        if let delegate = delegate{
            delegate.doSomethingWith(data: "wakwaw")
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
