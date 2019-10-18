

import UIKit

class ShortListTableViewController: UITableViewController {

    var MyData = [list]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loaddata()
        
    }
    func loaddata(){
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")
        var myrequest = URLRequest(url: url!)
        myrequest.httpMethod = "GET"
        let session = URLSession.shared
        var res =  session.dataTask(with: myrequest) { (data : Data?, response : URLResponse?, error : Error?) in
            if error != nil {
                print("Error")
            }
            do {
                
                let root = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSArray
                for item in root{
                var tempRoot = item as! NSDictionary
                 let obj  = list()
                    obj.ID = tempRoot.object(forKey: "id") as! Int
                    obj.name = tempRoot.object(forKey: "name")as! String
                    obj.username = tempRoot.object(forKey: "username")as! String
                    obj.email = tempRoot.object(forKey: "email")as! String
                    var myaddress = tempRoot.object(forKey: "address")as! NSDictionary
                    
                    obj.street = myaddress.object(forKey: "street")as! String
                    obj.suite = myaddress.object(forKey: "suite")as! String
                    obj.city = myaddress.object(forKey: "city")as! String
                    obj.zipcode = myaddress.object(forKey: "zipcode")as! String
                    var mylocation = myaddress.object(forKey: "geo")as! NSDictionary
                    obj.lat = mylocation.object(forKey: "lat") as! String
                    obj.long = mylocation.object(forKey: "lng")as! String
                    obj.phone = tempRoot.object(forKey: "phone")as! String
                    obj.website = tempRoot.object(forKey: "website")as! String
                    var n = tempRoot.object(forKey: "company")as! NSDictionary
                    obj.companyName = n.object(forKey: "name")as! String
                    obj.catchphrase = n.object(forKey: "catchPhrase")as! String
                    self.MyData.append(obj)
                    self.tableView.reloadData()
                }
                
            }
        }
        res.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return MyData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")as! MyTableViewCell
        cell.txtID.text = String(MyData[indexPath.row].ID)
        cell.txtname.text = MyData[indexPath.row].name
        cell.txtphone.text = MyData[indexPath.row].phone

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
  override  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var tempdata = MyData[indexPath.row]
        var navigate = storyboard?.instantiateViewController(withIdentifier: "c1")as! ViewController
    navigate.displaydata = tempdata
    self.navigationController?.pushViewController(navigate, animated: true)
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
