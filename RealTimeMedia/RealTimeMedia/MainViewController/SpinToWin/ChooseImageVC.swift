//
//  ChooseImageVC.swift
//  Lands
//
//  Created by Bunty on 09/03/17.
//  Copyright © 2017 Bunty. All rights reserved.
//

import UIKit

protocol ChooseImageDelegate {
    func selectImage(img : UIImage)
    
}

class ChooseImageVC: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{

    
    var delegate : ChooseImageDelegate?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let images   = ["1","2","3" , "4","5","6","7","8","9","10"]
    
    var isFromSecondView : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        collectionView.delegate = self
        
    }

    @IBAction func btnClose(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
     // _ = navigationController?.popViewController(animated: true)
        
    }
 
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : ImageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCell

        cell.img.image = UIImage(named: images[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell : ImageCell = collectionView.cellForItem(at: indexPath) as! ImageCell
        
        dismiss(animated: true, completion: {
            com in
            self.delegate?.selectImage(img: cell.img.image!)
        })
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/2 - (20)  , height: (collectionView.frame.size.width/2))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 10, right: 5)
    }

    override var prefersStatusBarHidden: Bool{
        
        return true
    }
}
