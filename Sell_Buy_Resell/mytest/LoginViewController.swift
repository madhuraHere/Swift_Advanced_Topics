//
//  LoginViewController.swift
//  mytest
//
//  Created by Mac on 27/03/19.
//  Copyright © 2019 Madhura. All rights reserved.
//

import UIKit
import CoreData
class LoginViewController: UIViewController {

    var context = AppDelegate().persistentContainer.viewContext
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var userpassword: UITextField!
    static var selectedUser = UserDetails()
    
    @IBAction func loginbtn(_ sender: Any) {
        
        
        var myrequest = NSFetchRequest<UserDetails>(entityName: "UserDetails")
        var myresponse = try! context.fetch(myrequest)
        
        if username.text != nil && userpassword.text != nil {
            for temuserdeatils in myresponse {
                if temuserdeatils.username == username.text {
                    if temuserdeatils.password2 == userpassword.text {
                        LoginViewController.selectedUser = temuserdeatils
                        var alertsuccesful = UIAlertController(title: "Alert", message: "Login Successful", preferredStyle: .actionSheet)
                        var action1 = UIAlertAction(title: "Ok", style: .default) { (temp) in
                            var
                            vc1 = self.storyboard?.instantiateViewController(withIdentifier: "s1")as! LoginSuccessfulViewController
                            vc1.Uname = temuserdeatils.username!
                            self.navigationController?.pushViewController(vc1, animated: true)
                        }
                        alertsuccesful.addAction(action1)
                        self.present(alertsuccesful, animated: true, completion: nil)
                    
                }
                    else if temuserdeatils.password2 != userpassword.text {
                        var a1 = UIAlertController(title: "Alert", message: "Please Check password", preferredStyle: .alert)
                        var c1 = UIAlertAction(title: "Ok", style: .default, handler: nil)
                        a1.addAction(c1)
                        self.present(a1, animated: true, completion: nil)
                    }
                
                }
                else{
                    var alertoutofrang = UIAlertController(title: "Alert", message: "Hey,You are a new user,Signup first", preferredStyle: .alert)
                    var actionoutofrange = UIAlertAction(title: "Ok", style: .default, handler: nil)
                    alertoutofrang.addAction(actionoutofrange)
                    self.present(alertoutofrang, animated: true, completion: nil) }
            }
        }
        else {
       var v2 = UIAlertController(title: "Alert", message: "Please Fill the details", preferredStyle: .alert)
            var v3 = UIAlertAction(title: "Ok", style: .default, handler: nil)
            v2.addAction(v3)
            self.present(v2, animated: true, completion: nil)
            
        }
        
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

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
