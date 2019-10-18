

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var contactphone: UILabel!
    
    
    @IBAction func showlocation(_ sender: Any) {
        
        var vc = storyboard?.instantiateViewController(withIdentifier: "v1")as! ShowLocationViewController
        vc.t1 = displaydata.lat
        vc.t2 = displaydata.long
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    @IBOutlet weak var myID: UILabel!
    
    
    @IBOutlet weak var contactweb: UILabel!
    
    
    
    @IBOutlet weak var CompName: UILabel!
    
    
    
    @IBOutlet weak var myphrase: UILabel!
    
    
    @IBOutlet weak var name1: UILabel!
    
    
    @IBOutlet weak var username1: UILabel!
    
    @IBOutlet weak var email1: UILabel!
    
    
    @IBOutlet weak var Astreet: UILabel!
    
    @IBOutlet weak var Acity: UILabel!
    
    
    @IBOutlet weak var Azipcode: UILabel!
    
    @IBOutlet weak var Alng: UILabel!
    
    
    
    
    @IBOutlet weak var Asuite: UILabel!
    
    
    
    
    @IBOutlet weak var Alat: UILabel!
    

    
     var displaydata = list()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name1.text = displaydata.name
        username1.text = displaydata.username
        myID.text = String(displaydata.ID)
        email1.text = displaydata.email
        
        Astreet.text = displaydata.street
        Acity.text = displaydata.city
        Alat.text = displaydata.lat
        Alng.text = displaydata.long
        Asuite.text = displaydata.suite
        Azipcode.text = displaydata.zipcode
        
        contactphone.text = displaydata.phone
        contactweb.text = displaydata.website
        
        CompName.text = displaydata.companyName
        myphrase.text = displaydata.catchphrase
        
       tabBarItem.title = "DETAILS"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

