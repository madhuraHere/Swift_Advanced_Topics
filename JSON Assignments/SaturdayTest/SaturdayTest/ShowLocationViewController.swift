

import UIKit
import MapKit

class ShowLocationViewController: UIViewController,MKMapViewDelegate {

    var t1 : String!
    var t2 : String!
    
    @IBOutlet weak var mylocation: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let testpoint = MKPointAnnotation()
        testpoint.coordinate.latitude = Double(t1)!
        testpoint.coordinate.longitude = Double(t2)!
        mylocation.delegate = self
        mylocation.addAnnotation(testpoint)
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: nil)
        
        
        return pin
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
