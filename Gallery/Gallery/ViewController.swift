import UIKit
class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    var picker : UIImagePickerController!
    
    @IBOutlet weak var imagedata: UIImageView!
    @IBAction func btnDisplay(_ sender: Any) {
        picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(picker, animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let pickedImage = info["UIImagePickerControllerOriginalImage"]as! UIImage
        imagedata.image = pickedImage
        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

