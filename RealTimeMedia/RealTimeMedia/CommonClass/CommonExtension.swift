//
//  CommonExtension.swift
//  RealTimeMedia
//
//  Created by Bunty on 28/03/17.
//  Copyright © 2017 Bunty. All rights reserved.
//

import UIKit

extension UIView {
    func addGradientWithColor(firstColor : UIColor, secondColor: UIColor , width : CGFloat) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.frame.size.width = width
        gradient.colors = [firstColor.cgColor, secondColor.cgColor]
        
        self.layer.insertSublayer(gradient, at: 0)
    }
}

//order change of arrray======
extension MutableCollection where Index == Int {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffle() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in startIndex ..< endIndex - 1 {
            let j = Int(arc4random_uniform(UInt32(endIndex - i))) + i
            if i != j {
                swap(&self[i], &self[j])
            }
        }
    }
}
//================end ==========
