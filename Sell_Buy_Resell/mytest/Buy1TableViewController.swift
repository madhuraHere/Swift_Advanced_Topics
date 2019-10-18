import UIKit
import CoreData

class Buy1TableViewController: UITableViewController {
var context = AppDelegate().persistentContainer.viewContext
    
    var Response = [SellerDetails]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       

        uploadmycarDataa()
        
    }
    func uploadmycarDataa(){
        
        let data1 = SaveDetails()
        data1.Modelname = "Nano"
        data1.nameofowner = "Mrs Akshata Marathe"
        data1.contactofOWner = "akshatamarathe@gamil.com"
        data1.years = "1 years"
        data1.imageOfModel = UIImage(named: "tata-nano.jpg")
        data1.desc = "Good to start up with!"
        Seller1ViewController.MyData.append(data1)
        
        let data2 = SaveDetails()
        data2.Modelname = "Polo"
        data2.nameofowner = "Mr Nitin Deshpande"
        data2.contactofOWner = "deshpandenitin@@gamil.com"
        data2.years = "2 years"
        data2.imageOfModel = UIImage(named: "polo.jpg")
        data2.desc = "Amazing car wth fully serviced"
        Seller1ViewController.MyData.append(data2)
        
        let data3 = SaveDetails()
        data3.Modelname = "Honda City"
        data3.nameofowner = "Ms Neha "
        data3.contactofOWner = "nehasavant@@gamil.com"
        data3.years = "Two months"
        data3.imageOfModel = UIImage(named: "Hondacity.jpg")
        data3.desc = "Reliable petrol engine and wide torque"
        Seller1ViewController.MyData.append(data3)
        
        let data4 = SaveDetails()
        data4.Modelname = "Datsun Go"
        data4.nameofowner = "Neeta Patil"
        data4.contactofOWner = "neetapatil@gamil.com"
        data4.years = "3 years"
        data4.imageOfModel = UIImage(named: "go.png")
        data4.desc = "In a Good Condition"
        Seller1ViewController.MyData.append(data4)
        
        let data5 = SaveDetails()
        data5.Modelname = "Jaguar"
        data5.nameofowner = "Kiran Shaha"
        data5.contactofOWner = "shahakiran123@gmail.com"
        data5.years = "8 Months"
        data5.imageOfModel = UIImage(named: "car1.jpeg")
        data5.desc = "Jaguar Land Rover Automotive PLC is the holding company of Jaguar Land Rover Limited, a British multinational automotive company"
        Seller1ViewController.MyData.append(data5)
        
        let data6 = SaveDetails()
        data6.Modelname = "Mercedes benz"
        data6.nameofowner = "Natasha Poonawala"
        data6.contactofOWner = "natasha12poonawala@gamil.com"
        data6.years = "3 years"
        data6.imageOfModel = UIImage(named: "car2.jpeg")
        data6.desc = "A blend of luxury, sportiness & performance. Be it Saloon, Estate, Coupé, Cabriolet, Roadster, SUV & more."
        Seller1ViewController.MyData.append(data6)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    var temp = Seller1ViewController.MyData[indexPath.row]
        var svc1 = storyboard?.instantiateViewController(withIdentifier: "t1")as! Buy3ViewController
        svc1.myTData = temp
    self.navigationController?.pushViewController(svc1, animated: true)
    
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Seller1ViewController.MyData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)as! Buy2TableViewCell
        var s = Seller1ViewController.MyData[indexPath.row]
        cell.txtmodelname.text = "Model-\(s.Modelname!)"
        //cell.txtyears.text = s.years
        cell.txtcontactdetails.text = "Contact-\(s.contactofOWner!)"
        cell.myimage.image = s.imageOfModel

        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
