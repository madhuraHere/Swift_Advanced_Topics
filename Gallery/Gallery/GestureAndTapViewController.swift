import UIKit
class GestureAndTapViewController: UIViewController {

    
    @IBOutlet weak var lblimage: UIImageView!
    @IBOutlet weak var lbldata: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        //label Tapping
        lbldata.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        tapGesture.numberOfTapsRequired = 2
        lbldata.addGestureRecognizer(tapGesture)
        self.view.backgroundColor = UIColor.blue
        
        //Image Swipping
        lblimage.isUserInteractionEnabled = true
        let swipeImage = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        swipeImage.direction = UISwipeGestureRecognizerDirection.right
      lblimage.addGestureRecognizer(swipeImage)
        
    }
    
    @objc func swiped(_ recognizer: UISwipeGestureRecognizer){
        if recognizer.direction == UISwipeGestureRecognizerDirection.right{
            print("Right swiped")
        }
        
    }
    @objc func tapped(){
         print("Label tapped")
        
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
