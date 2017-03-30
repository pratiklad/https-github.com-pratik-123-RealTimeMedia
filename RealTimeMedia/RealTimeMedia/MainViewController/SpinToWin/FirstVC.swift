//
//  FirstVC.swift
//  Lands
//
//  Created by Bunty on 09/03/17.
//  Copyright © 2017 Bunty. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
    @IBAction func btnEnter(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
        
        self.navigationController?.pushViewController(nextVC, animated: false)
    
//        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ChooseImageVC") as! ChooseImageVC
//
//        self.present(nextVC, animated: true, completion: nil)
    
    }
    
    @IBAction func btnBack(_ sender: Any) {
        _ = navigationController?.popToRootViewController(animated: true)
    }
    
    
    override var prefersStatusBarHidden: Bool{
        return true
    }

}
