import UIKit
class Ass1TableViewController: UITableViewController {
    var Sarray = [Student]()
    override func viewDidLoad() {
        super.viewDidLoad()
      readDB()
    }
    func readDB(){
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
            let query = "select *from Student"
            var statement :OpaquePointer? = nil
            
            if sqlite3_prepare(op, query.cString(using: .utf8), -1 , &statement, nil) == SQLITE_OK{
                while sqlite3_step(statement) == SQLITE_ROW {
                    
        let sname = String.init(format: "%s", sqlite3_column_text(statement, 0))
        let sroll = Int(sqlite3_column_int(statement, 1))
                    let s = Student()
                    s.name = sname
                    s.roll = sroll
                    self.Sarray.append(s)
                }
            }
            
        }
        sqlite3_close(op)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return Sarray.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = Sarray[indexPath.row].name
       
cell.detailTextLabel?.text = String(Sarray[indexPath.row].roll)
        
        
        return cell
    }
    

    

}
