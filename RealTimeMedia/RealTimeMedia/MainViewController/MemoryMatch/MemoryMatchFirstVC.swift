//
//  MemoryMatchFirstVC.swift
//  RealTimeMedia
//
//  Created by Bunty on 30/03/17.
//  Copyright © 2017 Bunty. All rights reserved.
//

import UIKit

class MemoryMatchFirstVC: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var highitContsraionCV: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var viewMatch: UIView!
    @IBOutlet weak var imgMatch: UIImageView!

    
    var array : [Bool] = []
    var imageRandomArray : [String] = []
    var selectIndex : [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        for _ in 0..<12
        {
            array.append(false)
        }
        
        for i in 0..<6
        {
            if i == 0
            {
                imageRandomArray.append("card6.png")
            }
            else
            {
                imageRandomArray.append("card\(i).png")
            }
        }
        
        for i in (0..<6).reversed()
        {
            if i == 0
            {
                imageRandomArray.append("card6.png")
            }
            else
            {
                imageRandomArray.append("card\(i).png")
            }
        }
        
        imageRandomArray.shuffle()
        
        
        print("imageRandomArray =>\(imageRandomArray)")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let vW = (view.frame.size.width / 2)
        highitContsraionCV.constant = (vW ) * 6

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
    
    var isSelectImage : Bool = false
    var delSelectIndex : IndexPath?
    //MARK: didSelectItemAt
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell : ClickRevealCell = collectionView.cellForItem(at: indexPath) as! ClickRevealCell
        
        // print("selectItemAt indexPath ->\(indexPath.row)")
        
        if !selectIndex.contains(indexPath.row)
        {
            if cell.imageViewContent.isHidden
            {
                isSelectImage = true
                UIView.transition(from: cell.imageView, to: cell.imageViewContent, duration: 0.8, options: [.transitionFlipFromLeft , .showHideTransitionViews ], completion: { com in
                    
                    if self.delSelectIndex != nil
                    {
                        self.isSelectImage = false
                        let imgName = self.imageRandomArray[(self.delSelectIndex?.row)!]
                        let img1Name = self.imageRandomArray[indexPath.row]
                        
                        
                        if imgName == img1Name
                        {
                            // print("you are winner")
                            
                            self.selectIndex.append(indexPath.row)
                            self.selectIndex.append((self.delSelectIndex?.row)!)
                            
                            self.imgMatch.image = UIImage(named: imgName)
                            
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                                UIView.animate(withDuration: 0.5, animations: {
                                    
                                    self.viewMatch.isHidden = false
                                    self.view.layoutIfNeeded()
                                })
                            })
                        }
                        else
                        {
                            let cellDeSelect  : ClickRevealCell = collectionView.cellForItem(at: self.delSelectIndex!) as! ClickRevealCell
                            
                            if cellDeSelect.imageViewContent.isHidden
                            {
                                UIView.transition(from: cellDeSelect.imageView, to: cellDeSelect.imageViewContent, duration: 0.8, options: [.transitionFlipFromLeft , .showHideTransitionViews ], completion: { com in
                                })
                            }
                            else
                            {
                                UIView.transition(from: cellDeSelect.imageViewContent, to: cellDeSelect.imageView, duration: 0.8, options: [.transitionFlipFromLeft , .showHideTransitionViews ], completion: { com in
                                })
                            }
                            
                            
                            let cellSelect  : ClickRevealCell = collectionView.cellForItem(at: indexPath) as! ClickRevealCell
                            
                            if cellSelect.imageViewContent.isHidden
                            {
                                UIView.transition(from: cellSelect.imageView, to: cellSelect.imageViewContent, duration: 0.8, options: [.transitionFlipFromLeft , .showHideTransitionViews ], completion: { com in
                                })
                            }
                            else
                            {
                                UIView.transition(from: cellSelect.imageViewContent, to: cellSelect.imageView, duration: 0.8, options: [.transitionFlipFromLeft , .showHideTransitionViews ], completion: { com in
                                })
                            }
                        }
                        self.delSelectIndex = nil
                    }
                })
            }
            else
            {
                self.isSelectImage = true
                UIView.transition(from: cell.imageViewContent, to: cell.imageView, duration: 0.8, options: [.transitionFlipFromLeft , .showHideTransitionViews ], completion: { com in
                    
                    if self.delSelectIndex != nil
                    {
                        self.isSelectImage = false
                        let imgName = self.imageRandomArray[(self.delSelectIndex?.row)!]
                        let img1Name = self.imageRandomArray[indexPath.row]
                        
                        
                        if imgName == img1Name
                        {
                            //print("you are winner")
                            
                            self.selectIndex.append(indexPath.row)
                            self.selectIndex.append((self.delSelectIndex?.row)!)
                            
                            self.imgMatch.image = UIImage(named: imgName)
                            
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                                UIView.animate(withDuration: 0.5, animations: {
                                    
                                    self.viewMatch.isHidden = false
                                    self.view.layoutIfNeeded()
                                })
                            })
                        }
                        else
                        {
                            let cellDeSelect  : ClickRevealCell = collectionView.cellForItem(at: self.delSelectIndex!) as! ClickRevealCell
                            
                            if cellDeSelect.imageViewContent.isHidden
                            {
                                UIView.transition(from: cellDeSelect.imageView, to: cellDeSelect.imageViewContent, duration: 0.8, options: [.transitionFlipFromLeft , .showHideTransitionViews ], completion: { com in
                                })
                            }
                            else
                            {
                                UIView.transition(from: cellDeSelect.imageViewContent, to: cellDeSelect.imageView, duration: 0.8, options: [.transitionFlipFromLeft , .showHideTransitionViews ], completion: { com in
                                })
                            }
                            
                            
                            let cellSelect  : ClickRevealCell = collectionView.cellForItem(at: indexPath) as! ClickRevealCell
                            
                            if cellSelect.imageViewContent.isHidden
                            {
                                UIView.transition(from: cellSelect.imageView, to: cellSelect.imageViewContent, duration: 0.8, options: [.transitionFlipFromLeft , .showHideTransitionViews ], completion: { com in
                                })
                            }
                            else
                            {
                                UIView.transition(from: cellSelect.imageViewContent, to: cellSelect.imageView, duration: 0.8, options: [.transitionFlipFromLeft , .showHideTransitionViews ], completion: { com in
                                })
                            }
                        }
                        self.delSelectIndex = nil
                    }
                })
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        // print(" DeselectItemAt indexPath ->\(indexPath.row)")
        
        if isSelectImage
        {
            self.delSelectIndex = indexPath
        }
    }

    
    //MARK: collectionViewLayout: UICollectionViewLayout, sizeForItemAt
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let vW = (view.frame.size.width / 2) - 30
        return CGSize(width:  vW , height: vW + 20)
    }
    //MARK: insetForSectionAt
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 10, right: 5)
    }
    //===========end collection view delegate method=============
    
    //MARK: Button Continue
    @IBAction func btnContinue(_ sender: Any) {
        
        if selectIndex.count == 12
        {
            _ = navigationController?.popViewController(animated: true)
        }
        else
        {
            UIView.animate(withDuration: 0.5) {
                self.viewMatch.isHidden = true
                self.view.layoutIfNeeded()
            }
        }
    }
    //==============end Continue button
    
    //MARK: Button Close x
    @IBAction func btnCloseView(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    //===============end close button
    
}
