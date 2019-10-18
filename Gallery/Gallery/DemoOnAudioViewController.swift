
import UIKit
import AVKit
import AVFoundation
import MediaPlayer

class DemoOnAudioViewController: UIViewController {
    var audio : AVAudioPlayer!
  
    @IBAction func btn1(_ sender: Any) {
        
        let path = Bundle.main.url(forResource: "000", withExtension: ".mp4")
        let player = AVPlayer(url: path!)
        let movieViewcontroller = AVPlayerViewController()
        movieViewcontroller.player = player
        self.present(movieViewcontroller, animated: true, completion: nil)
        
    }
    
    //Audio Player
    @IBAction func playsong(_ sender: Any) {
        audio.play()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
   let path1 = Bundle.main.url(forResource: "Amplifier", withExtension: ".mp3")
        audio = try! AVAudioPlayer(contentsOf: path1!)
        audio.prepareToPlay()
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
