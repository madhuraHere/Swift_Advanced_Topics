import UIKit

class ViewController: UIViewController {
    let pdftitle = "Swift Language"
    
    @IBAction func OpenPDFBtn(_ sender: Any) {
        
        if let url = Bundle.main.url(forResource: pdftitle, withExtension: "pdf"){
            let webview = UIWebView(frame: self.view.frame)
            let urlrequest = URLRequest(url: url)
            webview.loadRequest(urlrequest as! URLRequest)
            //self.view.addSubview(webview)
            //extended
            let pdvc = UIViewController()
            pdvc.view.addSubview(webview)
            pdvc.title = pdftitle
            self.navigationController?.pushViewController(pdvc, animated: true)
        }
        
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

