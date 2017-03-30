//
//  DashBoardVC.swift
//  RealTimeMedia
//
//  Created by Bunty on 14/03/17.
//  Copyright © 2017 Bunty. All rights reserved.
//

import UIKit

var iCount : Int = 0


class DashBoardVC: UIViewController {

    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.statusBarStyle = .lightContent
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    
    //MARK: Button Scratch & Win
    @IBAction func btnScratchToWin(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ScrechVC") as! ScrechVC
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    
    }
    
    //MARK: Button Spin To Win
    @IBAction func btnSpinToWin(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "FirstVC") as! FirstVC
        
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
    //MARK: BUtton Slot Tumb
    @IBAction func btnSlotTumb(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SlotTumblerFirstVC") as! SlotTumblerFirstVC
        
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
    @IBAction func btnClickRevel(_ sender: Any) {
        
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ClickRevealFirstVC") as! ClickRevealFirstVC
        
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
    @IBAction func btnMemoryMatch(_ sender: Any) {
        
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "MemoryMatchFirstVC") as! MemoryMatchFirstVC
        
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
    @IBAction func btnTicTock(_ sender: Any) {
        
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "TicTacToeFirstVC") as! TicTacToeFirstVC
        
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
    
    override var prefersStatusBarHidden: Bool{
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
      return .lightContent
    }
    
}
