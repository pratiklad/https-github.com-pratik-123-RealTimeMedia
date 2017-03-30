//
//  SecondVC.swift
//  Lands
//
//  Created by Bunty on 09/03/17.
//  Copyright © 2017 Bunty. All rights reserved.
//

import UIKit

class SecondVC: UIViewController , ChooseImageDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func btnChoose(_ sender: Any) {
        
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ChooseImageVC") as! ChooseImageVC

        nextVC.delegate = self
        nextVC.isFromSecondView = true
        nextVC.modalPresentationStyle = .overCurrentContext
        self.present(nextVC, animated: true, completion: nil)
        //self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func selectImage(img : UIImage)  {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SelectedImageVC") as! SelectedImageVC

        nextVC.imgSelect = img

        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    override var prefersStatusBarHidden: Bool{
        
        return true
    }
}
