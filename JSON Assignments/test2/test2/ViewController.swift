//
//  ViewController.swift
//  test2
//
//  Created by Mac on 26/03/19.
//  Copyright © 2019 Madhura. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

   @IBOutlet weak var mydata: UIPickerView!
    
    var myNewsArray = [News]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        loadnewsData()
        
    }
    func loadnewsData(){
        
        var url = URL(string: "https://www.googleapis.com/youtube/v3/playlists?part=snippet%20&channelId=UC_x5XG1OV2P6uZZ5FSM9Ttw%20&key=AIzaSyD3-rVQCVkN9bxkETMuojKmJCrU2gssB8Q")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data : Data?, response : URLResponse?, error : Error?) in
            if error != nil {
                print("Error")
            }
            
            do {
                let rootOfURL = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)as! NSDictionary
                let ArrayOfRoot = rootOfURL.object(forKey: "items")as! NSArray
                for myelement in ArrayOfRoot {
                    var temp1 = myelement as! NSDictionary
                    var NewsObj = News()
                    var sneppit = temp1.object(forKey: "snippet")as! NSDictionary
                    NewsObj.publishedDate = sneppit.object(forKey: "publishedAt")as!String
                    NewsObj.title = sneppit.object(forKey: "title")as! String
                    NewsObj.desc = sneppit.object(forKey: "description")as! String
                    var temp2 = sneppit.object(forKey: "thumbnails")as! NSDictionary
                    var temp3 = temp2.object(forKey: "default")as! NSDictionary
                    NewsObj.imageURL = temp3.object(forKey: "url")as! String
                    let imagedata = try! Data.init(contentsOf: URL(string: NewsObj.imageURL)!)
                    NewsObj.myimage = UIImage(data: imagedata)
                    
                    NewsObj.channelTitle = sneppit.object(forKey: "channelTitle")as! String
                    
                    self.myNewsArray.append(NewsObj)
                    self.mydata.reloadAllComponents()
                }
                
            }
            
        }
        task.resume()
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myNewsArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myNewsArray[row].channelTitle
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        var svc = storyboard?.instantiateViewController(withIdentifier: "v1")as!NewsDetailViewController
        svc.temp = myNewsArray[row]
        self.navigationController?.pushViewController(svc, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

