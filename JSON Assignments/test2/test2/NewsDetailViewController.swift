//
//  NewsDetailViewController.swift
//  test2
//
//  Created by Mac on 26/03/19.
//  Copyright © 2019 Madhura. All rights reserved.
//

import UIKit

class NewsDetailViewController: UIViewController {
    
    
    @IBOutlet weak var lbltitle: UILabel!
    
    
    
    @IBOutlet weak var lblRdate: UILabel!
    
    
    
    @IBOutlet weak var lbldesc: UILabel!
    var temp = News()

    override func viewDidLoad() {
        super.viewDidLoad()

        lbltitle.text = temp.title
        lblRdate.text = temp.publishedDate
        lbldesc.text = temp.desc
        
        
        // Do any additional setup after loading the view.
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
