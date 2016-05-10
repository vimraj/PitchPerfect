//
//  PlaySoundsViewController.swift
//  PitchPerfect2
//
//  Created by vimal raj on 5/9/16.
//  Copyright © 2016 vimal raj. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!

    enum ButtonType: Int { case Slow = 0, Fast, Chipmunk, Vader}

    var recordedAudioURL: NSURL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: NSTimer!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Play sounds view did load")
        print(recordedAudioURL!)
        // Do any additional setup after loading the view.
        setupAudio()
    }

    override func viewWillAppear(animated: Bool) {
        configureUI(.NotPlaying)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func stopRecording(sender: AnyObject) {
        print("Stop button pressed")
        stopAudio()
    }
    
    @IBAction func playRecording(sender: AnyObject) {
        print("Play button pressed")
        print(sender.tag!)
        switch ButtonType(rawValue: (sender.tag))! {
         case .Fast:
         playSound(rate: 0.5)
         case .Slow:
         playSound(rate: 1.5)
         case .Vader:
            playSound(pitch:1000)
         case .Chipmunk:
            playSound(pitch:-1000)
        default:
            playSound()
         }
        configureUI(.Playing)
        
    }
    
    // MARK: - Navigation

        

}
