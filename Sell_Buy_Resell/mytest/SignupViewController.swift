import UIKit
import CoreData
class SignupViewController: UIViewController {

    
    @IBOutlet weak var newusername: UITextField!
    
    
    @IBOutlet weak var newemailID: UITextField!
    
    
    @IBOutlet weak var newpass1: UITextField!
    
    
    
    @IBOutlet weak var newpass2: UITextField!
    
    var context = AppDelegate().persistentContainer.viewContext
    
    
    @IBAction func reisterbtn(_ sender: Any) {
        
        var obj = NSEntityDescription.insertNewObject(forEntityName:  "UserDetails", into: context)as! UserDetails
        obj.username = newusername.text
        obj.emailID = newemailID.text
        obj.password1 = newpass1.text
        obj.password2 = newpass2.text
        if newpass1.text == newpass2.text {
           try! context.save()
            var alert1 = UIAlertController(title: "Alert", message: "SignUp Process Completed,Login Now", preferredStyle: .actionSheet)
            var action1 = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert1.addAction(action1)
            self.present(alert1, animated: true, completion: nil)
        }
        else{
            
            var alert2 = UIAlertController(title: "Alert", message: "Please Check the password", preferredStyle: .actionSheet)
            var action2 = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert2.addAction(action2)
            self.present(alert2, animated: true, completion: nil)
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
