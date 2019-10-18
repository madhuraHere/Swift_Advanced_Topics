
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nametxt: UITextField!
    
    @IBOutlet weak var rolltxt: UITextField!
   // static var studentarray = [Student]()
    
    @IBAction func passbtn(_ sender: UIButton) {
        
        
               /* let vc = storyboard?.instantiateViewController(withIdentifier: "s1")as! Ass1TableViewController
                self.navigationController?.pushViewController(vc, animated: true)*/
        
        
       
        
    }
    

    
    
    @IBAction func savebtn(_ sender: UIButton) {
        let dir = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        
        let dbpath = dir.appendingPathComponent("sqLiteDatabase")
        let m = FileManager()
        
        if m.fileExists(atPath: dbpath.path){
            print("File exists")
        }
        else {
            m.createFile(atPath: dbpath.path, contents: nil, attributes: nil)
        }
        var op : OpaquePointer? = nil
        if sqlite3_open(dbpath.path, &op) == SQLITE_OK{
            print("Database opened")
             let name = nametxt.text
             let roll = Int(rolltxt.text!)
            
            
            //let query = "create table Student(name varchar[20],roll integer)"
            let query = String.init(format: "insert into Student values('%@',%d)", name!,roll!)
            if sqlite3_exec(op, query, nil, nil, nil) == SQLITE_OK{
                //print("Table created")
                print("Data inserted")
                
                
            }
            else {
                //print("Table not created")
                print("Data not inserted")
            }
            
        }
        else {
            print("Database not opened")
        }
        sqlite3_close(op)
        
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

