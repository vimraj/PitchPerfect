//
//  ViewController.swift
//  PitchPerfect2
//
//  Created by vimal raj on 5/9/16.
//  Copyright © 2016 vimal raj. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
   
    var audioRecorder: AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        stopButton.enabled = false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
     }

    @IBAction func recordAudio(sender: AnyObject) {
        print("Button was pressed")
        recordingLabel.text = "Recording in progress"
        stopButton.enabled = true
        recordButton.enabled = false
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)
        print(dirPath)
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath[0], recordingName]
        print(pathArray)
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        //    print(filePath)
        //} else {
        //    print("File not found")
        //}
        //print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        audioRecorder.meteringEnabled = true
        audioRecorder.delegate = self
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    @IBAction func stopRecording(sender: AnyObject) {
        recordingLabel.text = "Tap to record"
        stopButton.enabled = false
        recordButton.enabled = true
        audioRecorder.stop()
        let session = AVAudioSession.sharedInstance()
        try! session.setActive(false)
        
    }
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        print("Finished recording")
        if(flag) {
            self.performSegueWithIdentifier("stopRecordSegue", sender: audioRecorder.url)
        } else {
            print("Recording failed.")
        }
    }


}

