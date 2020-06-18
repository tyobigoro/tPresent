//
//  ViewController.swift
//  tPresent
//
//  Created by tyobigoro on 2020/06/18.
//  Copyright © 2020 tyobigoro. All rights reserved.
//

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

