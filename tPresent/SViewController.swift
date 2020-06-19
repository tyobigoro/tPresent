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
    
    var soundID: Int = 1000

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.startSystemSound()
    }
    
    
    @IBAction func transition() {
        self.stopSystemSound()
        let fVC = self.storyboard?.instantiateViewController(withIdentifier: "FViewController") as! FViewController
        self.present(fVC, animated: true, completion: nil)
        
    }
    
    func startSystemSound() {
          let systemSoundID = SystemSoundID(soundID)
          AudioServicesAddSystemSoundCompletion(systemSoundID, nil, nil, { (systemSoundID, nil) -> Void in
              AudioServicesPlaySystemSound(systemSoundID)
          }, nil)
          AudioServicesPlaySystemSound(systemSoundID)
      }
    
    func stopSystemSound() {
        AudioServicesRemoveSystemSoundCompletion(SystemSoundID(soundID))
        //AudioServicesDisposeSystemSoundID(SystemSoundID(soundID))
    }
}
