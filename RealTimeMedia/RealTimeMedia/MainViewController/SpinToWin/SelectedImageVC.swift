//
//  SelectedImageVC.swift
//  Lands
//
//  Created by Bunty on 09/03/17.
//  Copyright © 2017 Bunty. All rights reserved.
//

import UIKit

class SelectedImageVC: UIViewController , ChooseImageDelegate{

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var viewSpin: CustomView!
    @IBOutlet weak var viewImage: UIView!
    
    
    @IBOutlet weak var imgView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    
    @IBOutlet weak var btnChoseImg: UIButton!
    
    @IBOutlet weak var viewNotWIn: CustomButton!

    @IBOutlet weak var viewWin: CustomButton!
    
    var imgSelect : UIImage?
    var i1 = 0
    var i2 = 0
    var i3 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewImage.isHidden = true
        imageView.image = imgSelect
        viewNotWIn.isHidden = true
        viewWin.isHidden = true
    }

    @IBAction func btnChangeLook(_ sender: Any) {
        
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ChooseImageVC") as! ChooseImageVC
        
        nextVC.delegate = self
        nextVC.modalPresentationStyle = .overCurrentContext
        self.present(nextVC, animated: true, completion: nil)
        //self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func selectImage(img : UIImage)  {
        imageView.image = img
    }
    
    @IBAction func btnSpin(_ sender: Any) {
        
        
        btnChoseImg.isEnabled = false
        
        DispatchQueue.main.async(execute: {
            self.viewSpin.isHidden = true
            self.viewImage.isHidden = false
        })
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now(), execute: { ()->() in
            // your long running code here
            let myqueue: DispatchQueue = DispatchQueue(label: "queue", attributes: [])
            myqueue.async(execute: {
                DispatchQueue.main.async(execute: {
                    self.RandomImageSpin()
                });
            });
        })
    }
    
    func RandomImageSpin()  {
        
        var imgViewArray : [UIImage] = []
        for _ in 0...9
        {
            let random = Int(arc4random_uniform(10))
            if random == 0
            {
                   imgViewArray.append(UIImage(named: "10")!)
            }
            else
            {
                imgViewArray.append(UIImage(named: "\(random)")!)
            }
            i1 = random
        }
        self.imgView1.animationImages = imgViewArray
        self.imgView1.animationDuration = 2.0
        self.imgView1.startAnimating()
        
        var imgViewArray1 : [UIImage] = []
        for _ in 0...9
        {
            let random = Int(arc4random_uniform(10))
            if random == 0
            {
                imgViewArray1.append(UIImage(named: "10")!)
            }
            else
            {
                imgViewArray1.append(UIImage(named: "\(random)")!)
            }
            i2 = random
        }
        self.imageView2.animationImages = imgViewArray1
        self.imageView2.animationDuration = 2.0
        self.imageView2.startAnimating()
        
        
        var imgViewArray2 : [UIImage] = []
        for _ in 0...9
        {
            let random = Int(arc4random_uniform(10))
            if random == 0
            {
                imgViewArray2.append(UIImage(named: "10")!)
            }
            else
            {
                imgViewArray2.append(UIImage(named: "\(random)")!)
            }
            i3 = random

        }
        self.imageView3.animationImages = imgViewArray2
        self.imageView3.animationDuration = 2.0
        self.imageView3.startAnimating()
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            self.stopImageSpin()
        })
        
    }
    
    func stopImageSpin()  {
        
        self.imgView1.stopAnimating()
        self.imageView2.stopAnimating()
        self.imageView3.stopAnimating()
        
        self.imgView1.image = UIImage(named: "\(i1)")
        self.imageView2.image = UIImage(named: "\(i2)")
        self.imageView3.image = UIImage(named: "\(i3)")

        if (i1 == i2) || (i1 == i3)
        {
            self.viewImage.isHidden = true
            viewWin.isHidden = false
        }
        else
        {
            self.viewImage.isHidden = true
            viewNotWIn.isHidden = false
        }
    }
    
    @IBAction func btnContinue(_ sender: Any) {
      _ =  navigationController?.popToRootViewController(animated: true)
        
    }
    
    override var prefersStatusBarHidden: Bool{
        
        return true
    }
}
