//
//  ViewController.swift
//  Flipbook
//
//  Created by Cory Alder on 2015-07-31.
//  Copyright (c) 2015 Cory Alder. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var rightView: UIView!
    
    @IBOutlet weak var leftConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var rightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var perspective = CATransform3DIdentity;
        perspective.m34 = -1.0 / 850
        
        view.layer.sublayerTransform = perspective
        
        leftView.layer.anchorPoint = CGPoint(x: 1,y: 0.5)
        rightView.layer.anchorPoint = CGPoint(x: 0, y: 0.5)

        self.view.layoutIfNeeded()
//
        self.leftConstraint.constant = self.view.frame.width/4
//
        self.rightConstraint.constant = self.view.frame.width/4
        
    }
    
    @IBAction func panGesture(gesture: UIPanGestureRecognizer) {
        
        let translation = gesture.translationInView(self.view)
        
        let scaled = translation.x / (self.view.frame.size.width/2) * CGFloat(M_PI)
        
        if translation.x > 0 {
            // left to right
            leftView.layer.transform = CATransform3DMakeRotation(scaled, 0, 1.0, 0)
        } else {
            rightView.layer.transform = CATransform3DMakeRotation(scaled, 0, 1.0, 0)
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

