
import UIKit
class Buy3ViewController: UIViewController {

    
    @IBOutlet weak var timage: UIImageView!
    @IBOutlet weak var tmoelname: UILabel!
    
    @IBOutlet weak var tdesc: UILabel!
    
    var myTData = SaveDetails()
    
    static var cartArray = [SaveDetails]()
    
    @IBAction func addtocart(_ sender: Any) {
        Buy3ViewController.cartArray.append(myTData)

    }
    
    
    
    @IBAction func mycartbtn(_ sender: Any) {
        var vfc = storyboard?.instantiateViewController(withIdentifier: "a")as! CartViewController
        
        self.navigationController?.pushViewController(vfc, animated: true)
    }
    @IBOutlet weak var tcontact: UILabel!
    @IBOutlet weak var tyear: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tmoelname.text = "Model name:-\(myTData.Modelname!)"
        timage.image = myTData.imageOfModel
        tdesc.text = "Description:-\(myTData.desc!)"
        tcontact.text = "Contact Details:-\(myTData.contactofOWner!)"
        tyear.text = "Years:-\(myTData.years!)"
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
