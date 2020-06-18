//
//  ViewController.swift
//  tPresent
//
//  Created by tyobigoro on 2020/06/18.
//  Copyright © 2020 tyobigoro. All rights reserved.
//
import MediaPlayer
import UIKit

class FViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func transition() {
        let sVC = self.storyboard?.instantiateViewController(withIdentifier: "SViewContoroller") as! SViewContoroller
        self.present(sVC, animated: true, completion: nil)
    }
    
}


class SViewContoroller: UIViewController {
    
    @IBAction func transition() {
        self.stopSystemSound()
        let fVC = self.storyboard?.instantiateViewController(withIdentifier: "FViewController") as! FViewController
        self.present(fVC, animated: true, completion: nil)
        
    }
    
    
    var soundID: Int = 1000
    
    
    @IBAction func startSystemSound() {
        let systemSoundID = SystemSoundID(soundID)
        AudioServicesAddSystemSoundCompletion(systemSoundID, nil, nil, { (systemSoundID, nil) -> Void in
            AudioServicesPlaySystemSound(systemSoundID)
        }, nil)
        AudioServicesPlaySystemSound(systemSoundID)
    }
    
    @IBAction func stopSystemSound() {
        AudioServicesRemoveSystemSoundCompletion(SystemSoundID(soundID))
    }
    
}
