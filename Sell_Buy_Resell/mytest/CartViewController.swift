
import UIKit
import MessageUI
class CartViewController: UIViewController,MFMailComposeViewControllerDelegate,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var messagelabel: UILabel!
    
    @IBOutlet weak var mycartDATAInCart: UITableView!
    
    @IBAction func a(_ sender: Any) {
        let mailcVC = configureMailController()
        if MFMailComposeViewController.canSendMail(){
            self.present(mailcVC, animated: true, completion: nil)
           // messagelabel.text = "Email sent successfully on \(LoginViewController.selectedUser.emailID)"
            //messagelabel.backgroundColor = UIColor.white
        }
        else {
            showMailError()
        }
        
messagelabel.text = "Email sent successfully on \(LoginViewController.selectedUser.emailID!)"
messagelabel.backgroundColor = UIColor.white
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func configureMailController() -> MFMailComposeViewController {
        let mailcomposerVC = MFMailComposeViewController()
        mailcomposerVC.mailComposeDelegate = self
        mailcomposerVC.setToRecipients([LoginViewController.selectedUser.emailID!])
        mailcomposerVC.setSubject("Alert: Hey Hurry Up")
        mailcomposerVC.setMessageBody("Hey there's \(Buy3ViewController.cartArray.count) item in your cart ", isHTML: false)
        return mailcomposerVC
    }
    func showMailError(){
        var alert = UIAlertController(title: "Alert", message: "Device could not send an email", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Buy3ViewController.cartArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.textLabel?.text = Buy3ViewController.cartArray[indexPath.row].Modelname
        return cell
    }
  
}
