import UIKit
import CoreData
class Seller1ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    var context = AppDelegate().persistentContainer.viewContext
    
    @IBOutlet weak var txtmodelname: UITextField!
    
    @IBOutlet weak var myimage: UIImageView!
    
    static var MyData = [SaveDetails]()
    
    @IBAction func saveAllDetails(_ sender: Any) {
        var tempobj = SaveDetails()
        tempobj.Modelname = txtmodelname.text
        tempobj.years = txtyears.text
        tempobj.nameofowner = txtownername.text
        tempobj.contactofOWner = txtcontactdeatils.text
        tempobj.desc = txtdesc.text
        tempobj.imageOfModel = myimage.image
        Seller1ViewController.MyData.append(tempobj)
        var savealert = UIAlertController(title: "Alert", message: "Data Saved", preferredStyle: .alert)
        var savection = UIAlertAction(title: "Ok", style: .default, handler: nil)
        savealert.addAction(savection)
        self.present(savealert, animated: true, completion: nil)
    }
    
    @IBOutlet weak var txtdesc: UITextField!
    var picker : UIImagePickerController!
    @IBAction func Uploadmyimage(_ sender: Any) {
        picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(picker, animated: true, completion: nil)
    }
    
    @IBOutlet weak var save1: UIButton!
    
    @IBOutlet weak var txtyears: UITextField!
    
    @IBOutlet weak var txtownername: UITextField!
    
    @IBOutlet weak var txtcontactdeatils: UITextField!
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let pickedImage = info["UIImagePickerControllerOriginalImage"]as! UIImage
        myimage.image = pickedImage
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
  
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
