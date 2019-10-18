

import UIKit

class ContactTableViewController: UITableViewController {

    var tempArray = [Contacts]()
    override func viewDidLoad() {
        super.viewDidLoad()

        addtoFav()
       
    }

    
    func addtoFav(){
        
        var dir = try! FileManager.default.url(for: .documentationDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        
        let dbpath = dir.appendingPathComponent("Contactdb")
        let m = FileManager()
        if m.fileExists(atPath: dbpath.path){
            print("file Exists")
        }
        else {
            m.createFile(atPath: dbpath.path, contents: nil, attributes: nil)
        }
        var ptr : OpaquePointer? = nil
        if sqlite3_open(dbpath.path, &ptr) == SQLITE_OK{
         
            print("Database opened")
           
            let query = "select *from Contact"
            var statement : OpaquePointer? = nil
        
            if sqlite3_prepare(ptr, query, -1 , &statement, nil) == SQLITE_OK{
              
                while sqlite3_step(statement) == SQLITE_ROW {
                    
                    var cont = Contacts()
                    
                    let name1 = String.init(format: "%s", sqlite3_column_text(statement, 0))
                    
                    let id1 = String.init(format: "%s", sqlite3_column_text(statement, 1))
                    cont.name = name1
                    cont.ID = id1
                    tempArray.append(cont)
                    
                }
            }
        }
        sqlite3_close(ptr)
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tempArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "v1")
       cell.textLabel?.text = tempArray[indexPath.row].name
        cell.detailTextLabel?.text = tempArray[indexPath.row].ID
       

        return cell
    }



}
