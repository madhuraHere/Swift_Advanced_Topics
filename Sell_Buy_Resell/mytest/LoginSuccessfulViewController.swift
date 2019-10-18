//
//  LoginSuccessfulViewController.swift
//  mytest
//
//  Created by Mac on 27/03/19.
//  Copyright © 2019 Madhura. All rights reserved.
//

import UIKit
import CoreData
class LoginSuccessfulViewController: UIViewController {
    
    var context = AppDelegate().persistentContainer.viewContext
    
    
    @IBOutlet weak var txtusername: UILabel!
    
    static var MyCartArray = [SaveDetails]()
    @IBOutlet weak var cartcount: UILabel!
    
    @IBAction func mycartbtn(_ sender: Any) {
        
        cartcount.text = "0"
        
    }
    var Uname = String()

    override func viewDidLoad() {
        super.viewDidLoad()

        txtusername.text = Uname
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
