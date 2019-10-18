
import UIKit

//private let reuseIdentifier = "Cell"

class Contacts {
    
    
    var name : String!
    var ID : String!
    var email : String!
    var address : String!
    var gender : String!
    var phno : String!
    
}


class ContactCollectionViewController: UICollectionViewController {

    var contactArray = [Contacts]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadcontactData()
        
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

       
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var sel = contactArray[indexPath.row]
        let alert = UIAlertController(title: "Alert", message: "Save to Favourites??", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "Yes", style: .default) { (temp) in
            
            let dir = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            
            let dbpath = dir.appendingPathComponent("Contacts")
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
                let c1 = Contacts()
                let name = sel.name
                let id = sel.ID
                
                
                let query = String.init(format: "insert into Contactdb values('%@','%@')", name!,id!)
                if sqlite3_exec(op, query, nil, nil, nil) == SQLITE_OK{
                    
                    print("Data inserted")
                    
                    
                }
                else {
                    
                    print("Data not inserted")
                }
            }
            sqlite3_close(op)
        }
        let action2 = UIAlertAction(title: "No", style: .default, handler: nil)
        alert.addAction(action1)
        alert.addAction(action2)
        self.present(alert, animated: true, completion: nil)
    }
    func loadcontactData(){
        let url = URL(string:  "https://api.androidhive.info/contacts/")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data : Data?, response : URLResponse?, error:Error?) in
            if error != nil{
                print("Error")
            }
            do{
                
                let rootData = try! JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! NSDictionary
                let contcts = rootData.object(forKey: "contacts") as! NSArray
                for item in contcts{
                    var objcontact = Contacts()
                    var c1 = item as! NSDictionary
                    objcontact.ID = c1.object(forKey: "id")as! String
                    objcontact.name = c1.object(forKey: "name")as! String
                    objcontact.email = c1.object(forKey: "email")as! String
                    objcontact.address = c1.object(forKey: "address")as! String
                    objcontact.gender = c1.object(forKey: "gender")as! String
                    
                    var c2 = c1.object(forKey: "phone")as! NSDictionary
                    objcontact.phno = c2.object(forKey: "mobile")as! String
                    self.contactArray.append(objcontact)
                    self.collectionView?.reloadData()
                    
                }
                
                
                
            }
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return contactArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "c1", for: indexPath)as! ContactCollectionViewCell
       cell.name.text = contactArray[indexPath.row].name
        cell.Id.text = contactArray[indexPath.row].ID
        cell.address.text = contactArray[indexPath.row].address
        cell.email.text = contactArray[indexPath.row].email
        cell.gender.text = contactArray[indexPath.row].gender
        cell.phone.text = contactArray[indexPath.row].phno
      
    
        return cell
    }

    

}
