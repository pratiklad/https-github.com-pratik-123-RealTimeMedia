//
//  ThanksVC.swift
//  StarWars
//
//  Created by Bunty on 07/03/17.
//  Copyright © 2017 Bunty. All rights reserved.
//

import UIKit

protocol ScrechPageDelegate {
     func ReloadImageSrach()
}

class ThanksVC: UIViewController {

    var delegateScrech : ScrechPageDelegate!
    
    @IBOutlet weak var viewNotWin: UIView!
    @IBOutlet weak var viewWin: UIView!
    

    var iCount : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (iCount % 2) == 0
        {
            viewNotWin.isHidden = true
        }
        else
        {
            viewWin.isHidden = true
        }
    }

    
    @IBAction func btnContinue(_ sender: Any) {
        
       
        dismiss(animated: true, completion: {() in
             self.delegateScrech.ReloadImageSrach()
        })
        
    }
  
    override var prefersStatusBarHidden: Bool{
        
        return true
    }
}
