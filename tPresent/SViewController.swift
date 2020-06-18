//
//  SViewController.swift
//  tPresent
//
//  Created by tyobigoro on 2020/06/18.
//  Copyright © 2020 tyobigoro. All rights reserved.
//
import MediaPlayer
import UIKit


class SViewContoroller: UIViewController {
    
    @IBOutlet weak var startBtn: UIButton!
    
    var soundID: Int = 1000
    
    @IBAction func startBtnDidTap() {
        let systemSoundID = SystemSoundID(soundID)
        AudioServicesAddSystemSoundCompletion(systemSoundID, nil, nil, { (systemSoundID, nil) -> Void in
            AudioServicesPlaySystemSound(systemSoundID)
        }, nil)
        AudioServicesPlaySystemSound(systemSoundID)
        startBtn.isEnabled = false
    }
    
    @IBAction func stopBtnDidTap() {
        stopSystemSound()
    }
    
    func stopSystemSound() {
        AudioServicesRemoveSystemSoundCompletion(SystemSoundID(soundID))
        AudioServicesDisposeSystemSoundID(SystemSoundID(soundID))
        startBtn.isEnabled = true
    }
    
    @IBAction func transition() {
        self.stopSystemSound()
        let fVC = self.storyboard?.instantiateViewController(withIdentifier: "FViewController") as! FViewController
        self.present(fVC, animated: true, completion: nil)
        
    }
    
}
