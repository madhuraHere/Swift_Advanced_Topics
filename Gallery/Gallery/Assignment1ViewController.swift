
import UIKit

class Assignment1ViewController: UIViewController {

    @IBOutlet weak var im1: UIImageView!
    
    
    @IBOutlet weak var lblchangeimage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        lblchangeimage.isUserInteractionEnabled = true
        let ges = UITapGestureRecognizer(target: self, action: #selector(changeimage))
        
        ges.numberOfTapsRequired = 2
        lblchangeimage.addGestureRecognizer(ges)
        
        
    }
    @objc func changeimage(){
        
        im1.image = UIImage(named: "iapple.png")
        
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
