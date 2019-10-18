
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
    
        
        contactDB()
        
        
        return true
    }
    func contactDB(){
        
        let dir = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let dbpath = dir.appendingPathComponent("Contacts")
        let m = FileManager()
        if m.fileExists(atPath: dbpath.path){
            print("File Exists")
        }
        else {
            m.createFile(atPath: dbpath.path, contents: nil, attributes: nil)
        }
        var op : OpaquePointer? = nil
        
        if sqlite3_open(dbpath.path, &op) == SQLITE_OK {
            print("Database opened")
            let query = "create table Contactdb(name varchar[20],id varchar[20])"
            if sqlite3_exec(op, query, nil, nil, nil) == SQLITE_OK{
                print("Table Created")
            }
            else {
                print("Table not created")
            }
            
        }
        else {
            print("Database not created")
        }
        
        sqlite3_close(op)
    }
    
    
    
    
    
    
    

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

