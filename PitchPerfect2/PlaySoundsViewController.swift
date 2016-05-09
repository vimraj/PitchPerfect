//
//  PlaySoundsViewController.swift
//  PitchPerfect2
//
//  Created by vimal raj on 5/9/16.
//  Copyright © 2016 vimal raj. All rights reserved.
//

import UIKit

class PlaySoundsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Play sounds view did load")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if (segue.identifier == "stopRecordSegue") {
            let playSoundsVC = segue.destinationViewController as! PlaySoundsViewController
            let recordedAudioURL = sender as! NSURL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
    }
    */

}
