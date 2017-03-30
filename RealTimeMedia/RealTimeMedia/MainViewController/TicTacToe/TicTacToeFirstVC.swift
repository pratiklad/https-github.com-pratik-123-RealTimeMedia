//
//  TicTacToeFirstVC.swift
//  RealTimeMedia
//
//  Created by Bunty on 30/03/17.
//  Copyright © 2017 Bunty. All rights reserved.
//

import UIKit

class TicTacToeFirstVC: UIViewController ,UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{

    
    @IBOutlet weak var highitContsraionCV: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var viewWin: UIView!
    
    @IBOutlet weak var viewLoos: UIView!
    var array : [Bool] = []
    var imageRandomArray : [String] = []
    var selectIndex : [Int] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        for _ in 0..<9
        {
            array.append(false)
            
            let i = Int(arc4random_uniform(5))
            if i == 0
            {
                imageRandomArray.append("tic_tac_card1.png")
            }
            else
            {
                imageRandomArray.append("tic_tac_card\(i).png")
            }
        }
        
        imageRandomArray.shuffle()
        print("imageRandomArray =>\(imageRandomArray)")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let vW = (view.frame.size.width / 3)
        highitContsraionCV.constant = ((vW ) * 3)
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    //MARK: Button Back
    @IBAction func btnBack(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    
    //Collection view delegate method
    //MARK:numberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    //MARK:cellForItemAt
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell : ClickRevealCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ClickRevealCell
        
        cell.imageViewContent.image = UIImage(named: imageRandomArray[indexPath.row])
        
        cell.imageViewContent.isHidden = true
        
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

       
        
        if !selectIndex.contains(indexPath.row)
        {
            selectIndex.append(indexPath.row)
            let cell : ClickRevealCell = collectionView.cellForItem(at: indexPath) as! ClickRevealCell

            UIView.transition(from: cell.imageView, to: cell.imageViewContent, duration: 0.8, options: [.transitionFlipFromLeft , .showHideTransitionViews ], completion: { com in
                if self.selectIndex.count == 9
                {

                self.matchImage()
                }
            })
        }
    }
    
    func matchImage()  {
        var isSelect : Bool = false
        if imageRandomArray[0] == imageRandomArray[1] && imageRandomArray[1] == imageRandomArray[2]
        {
            isSelect = true
        }
        else if imageRandomArray[3] == imageRandomArray[4] && imageRandomArray[4] == imageRandomArray[5]
        {
            isSelect = true
        }
        else if imageRandomArray[6] == imageRandomArray[7] && imageRandomArray[7] == imageRandomArray[8]
        {
            isSelect = true
        }
        else if imageRandomArray[0] == imageRandomArray[3] && imageRandomArray[3] == imageRandomArray[6]
        {
            isSelect = true
        }
        else if imageRandomArray[1] == imageRandomArray[4] && imageRandomArray[4] == imageRandomArray[7]
        {
            isSelect = true
        }
        else if imageRandomArray[2] == imageRandomArray[5] && imageRandomArray[5] == imageRandomArray[8]
        {
            isSelect = true
        }
        else if imageRandomArray[0] == imageRandomArray[4] && imageRandomArray[4] == imageRandomArray[8]
        {
            isSelect = true
        }
        else if imageRandomArray[2] == imageRandomArray[4] && imageRandomArray[4] == imageRandomArray[6]
        {
            isSelect = true
        }
        
        if isSelect
        {
            //you win game
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                UIView.animate(withDuration: 0.5, animations: {
                    
                    self.viewWin.isHidden = false
                    self.view.layoutIfNeeded()
                })
            })
        }
        else
        {
            //you lose game
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                UIView.animate(withDuration: 0.5, animations: {
                    
                    self.viewLoos.isHidden = false
                    self.view.layoutIfNeeded()
                })
            })
        }
    }
    
    //MARK: collectionViewLayout: UICollectionViewLayout, sizeForItemAt
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let vW = (view.frame.size.width / 3) - 15
        return CGSize(width:  vW , height: vW )
    }
    //MARK: insetForSectionAt
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 0, bottom: 10, right: 0)
    }
    //===========end collection view delegate method=============

}
