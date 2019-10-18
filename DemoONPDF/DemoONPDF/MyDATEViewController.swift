
import UIKit

class MyDATEViewController: UIViewController {
    
    var formator : DateFormatter!
    
    @IBOutlet weak var mydata: UIDatePicker!
    
    
    @IBAction func myaction(_ sender: Any) {
        
        formator = DateFormatter()
        formator.dateFormat = "dd-mm-yyyy"
        let DateInFormater = formator.string(from: mydata.date)
        lbldate.text = DateInFormater
        print(DateInFormater)
    }
    
    
    
    @IBOutlet weak var lbldate: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       mydata.datePickerMode = UIDatePickerMode.date
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
