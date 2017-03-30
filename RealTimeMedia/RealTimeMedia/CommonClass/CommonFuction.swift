//
//  CommonFuction.swift
//  RealTimeMedia
//
//  Created by Bunty on 28/03/17.
//  Copyright © 2017 Bunty. All rights reserved.
//

import UIKit

func rotateView(viewDisplay: UIView, duration: Double = 1) {
    if viewDisplay.layer.animation(forKey: "isStartAnim") == nil {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = Float(M_PI * 2.0)
        rotationAnimation.duration = duration
        rotationAnimation.repeatCount = Float.infinity
        
        viewDisplay.layer.add(rotationAnimation, forKey: "isStartAnim")
    }
}
//====
