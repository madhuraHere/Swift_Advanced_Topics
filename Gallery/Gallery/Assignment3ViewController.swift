
import UIKit
import AVKit
import AVFoundation
import MediaPlayer

class Assignment3ViewController: UIViewController {
    
    var song : AVAudioPlayer!
    var sel = 0
    @IBOutlet weak var slide1: UISlider!
    
    
    
    @IBOutlet weak var btn: UIButton!
    
    @IBAction func btn(_ sender: UIButton) {
       
        song.play()
        btn.setTitle("Pause", for: UIControlState.normal)
        btn.addTarget(self, action: #selector(actionpause), for: UIControlEvents.touchUpInside)
        
        
    }
    @objc func actionpause(){
    btn.setTitle("Play", for: UIControlState.normal)
    song.pause()
    
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      let pathforsong = Bundle.main.url(forResource: "Amplifier", withExtension: ".mp3")
       song = try! AVAudioPlayer(contentsOf: pathforsong!)
       song.prepareToPlay()
        
       
        slide1.addTarget(self, action: #selector(changevol), for: UIControlEvents.valueChanged)
        
        
    }
    @objc func changevol(){
        
        sel = Int(slide1.value)
        //print(self.sel)
        song.volume = slide1.value
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
