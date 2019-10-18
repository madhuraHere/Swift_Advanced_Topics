import UIKit
class Assignment2ViewController: UIViewController {
    @IBOutlet weak var myimage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myimage.isUserInteractionEnabled = true
        let leftswip = UISwipeGestureRecognizer(target: self, action: #selector(swipleft))
        leftswip.direction = UISwipeGestureRecognizerDirection.left
        
        let rightswip = UISwipeGestureRecognizer(target: self, action: #selector(swipright))
        rightswip.direction = UISwipeGestureRecognizerDirection.right
        myimage.addGestureRecognizer(leftswip)
        myimage.addGestureRecognizer(rightswip)

    }
    
    @objc func swipright(_ r1 : UISwipeGestureRecognizer){
        if r1.direction == UISwipeGestureRecognizerDirection.right {
            self.myimage.backgroundColor = UIColor.red
        }
        
    }
    @objc func swipleft(_ r2 : UISwipeGestureRecognizer){
        if r2.direction == UISwipeGestureRecognizerDirection.left {
            self.myimage.backgroundColor = UIColor.blue
        }
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
