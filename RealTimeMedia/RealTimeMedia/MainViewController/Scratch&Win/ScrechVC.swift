//
//  ScrechVC.swift
//  StarWars
//
//  Created by Bunty on 07/03/17.
//  Copyright © 2017 Bunty. All rights reserved.
//

import UIKit
import ScratchCard

class ScrechVC: UIViewController , ScratchUIViewDelegate , ScrechPageDelegate{
    
    @IBOutlet weak var sView: UIView!
    var scratchCard: ScratchUIView!

    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        sView.layoutIfNeeded()
        
        let imgName = ((iCount % 2) == 0) ? "winImg" : "notWinImg"
        
        scratchCard = ScratchUIView(frame: CGRect(x: 8, y: 0, width: sView.bounds.size.width - 16, height: 200), Coupon: imgName, MaskImage: "img2", ScratchWidth: 40)
        
        self.sView.addSubview(scratchCard)
        
        scratchCard.layer.cornerRadius = 8
        scratchCard.clipsToBounds = true
        scratchCard.delegate = self
        self.view.layoutIfNeeded()
        
        let tapG : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.ClickOnScrollView))
        
        scrollView.addGestureRecognizer(tapG)
        
    }
    
    func ClickOnScrollView()  {
        scrollView.isScrollEnabled = true
    }
    
    @IBAction func btnBack(_ sender: Any) {
   
        _ = navigationController?.popToRootViewController(animated: true)
    }
    
    func scratchBegan(_ view: ScratchUIView) {
        let scratchPercent: Double = scratchCard.getScratchPercent()
       
        scrollView.isScrollEnabled = false
        if scratchPercent > 0.799
        {
            DisplayAlert()
        }
    }
    func scratchMoved(_ view: ScratchUIView) {
        let scratchPercent: Double = scratchCard.getScratchPercent()
        scrollView.isScrollEnabled = false
        if scratchPercent > 0.799
        {
            DisplayAlert()
        }
    }
    func scratchEnded(_ view: ScratchUIView) {
        let scratchPercent: Double = scratchCard.getScratchPercent()
        scrollView.isScrollEnabled = false
        if scratchPercent > 0.799
        {
            DisplayAlert()
        }
    }
    
    func DisplayAlert()  {

        let nextVC = self.storyboard?.instantiateViewController(withIdentifier:
            "ThanksVC") as! ThanksVC
        
        nextVC.modalPresentationStyle = .overCurrentContext

        nextVC.iCount = iCount
        nextVC.delegateScrech = self
        
        self.navigationController?.present(nextVC, animated: false, completion: nil)

    }
    
    func ReloadImageSrach()  {
        iCount = iCount + 1
        
       _ = navigationController?.popToRootViewController(animated: true)
        
        
    }
    
    override var prefersStatusBarHidden: Bool{
        
        return true
    }
    
    
}
