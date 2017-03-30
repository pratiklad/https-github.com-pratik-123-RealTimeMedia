//
//  SlotTumblerFirstVC.swift
//  RealTimeMedia
//
//  Created by Bunty on 28/03/17.
//  Copyright © 2017 Bunty. All rights reserved.
//

import UIKit
import QuartzCore

var firstColor : UIColor = UIColor.white
var secondColor : UIColor = UIColor.yellow

class SlotTumblerFirstVC: UIViewController {

    @IBOutlet weak var viewLoser: UIView!
    @IBOutlet weak var viewWin: UIView!
    
    @IBOutlet weak var viewNavigation: UIView!

    @IBOutlet weak var imgWheel: UIImageView!
    
    var iRandomNumber : Int = 0
    var arrayAngle : [Double] = [-60,-30,15]
    var angle : Double = 0
    
    var rotating = false
    var iCount = 0

    var duration = 5.0
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        iRandomNumber = Int(arc4random_uniform(2))
        angle = arrayAngle[iRandomNumber]
        
        //viewNavigation.addGradientWithColor(firstColor: firstColor, secondColor: secondColor,width: self.view.frame.size.width)

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }

    //MARK: button Back
    @IBAction func btnBack(_ sender: Any) {
        _ = navigationController?.popToRootViewController(animated: true)
    }
    //==========end back button========


    @IBAction func btnSpinToWin(_ sender: Any){
        iCount = 0
        rotating = true
        firstRotation()
    }
    
    func firstRotation() {
        iCount = iCount + 1
        UIView.animate(withDuration: duration, delay: 0.0, options: .curveLinear, animations: {() -> Void in
            self.imgWheel.transform = self.imgWheel.transform.rotated(by: .pi)
            self.secondRotation()

        }, completion: {(_ finished: Bool) -> Void in
        })
    }
    
    func secondRotation() {
        UIView.animate(withDuration: duration, delay: 0.0, options: .curveLinear, animations: {() -> Void in
            self.imgWheel.transform = self.imgWheel.transform.rotated(by: .pi)
            
            if self.rotating {
                if self.iCount < 5
                {
                    self.firstRotation()
                }
                else
                {
                    self.randomRotation(angle : self.angle)
                }
            }
        }, completion: {(_ finished: Bool) -> Void in

        })
    }
    
    func randomRotation(angle : Double)  {
            //-60 , -50 , 4 Session Tickets
            // -30  => Sorry
            //15 =>  Autographed Baseball
        
        UIView.animate(withDuration: duration, animations: { 
            self.imgWheel.transform = self.imgWheel.transform.rotated(by: CGFloat(angle))
            
        }) { (complate) in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
              
                if self.iRandomNumber == 1
                {
                    self.viewLoser.isHidden = false
                    self.view.layoutIfNeeded()
                }
                else
                {
                    self.viewWin.isHidden = false
                    self.view.layoutIfNeeded()
                }
            })
         
        }
        
    }
    
    @IBAction func btnContinue(_ sender: Any) {
        
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    
}
