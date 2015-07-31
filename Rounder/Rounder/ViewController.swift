//
//  ViewController.swift
//  Rounder
//
//  Created by Cory Alder on 2015-07-31.
//  Copyright (c) 2015 Cory Alder. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var layers = [CALayer]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let width: CGFloat = 30
        let radius: CGFloat = 100
        
        // soh cah toa
        //
        //a |\
        //d | \  <--- hyp
        //j |  \
        //   ---  <-- opp
        //
        
        let max = 30
        
        for i in 1...max {
            
            let orbLayer = CALayer()
            orbLayer.frame = CGRect(x: 0,y: 0,width: width,height: width)
            orbLayer.cornerRadius = width/2
            orbLayer.masksToBounds = true
            orbLayer.backgroundColor = UIColor.blueColor().CGColor
            
            self.view.layer.addSublayer(orbLayer)
            
            let angle = CGFloat(M_PI*2/Double(max) * Double(i))
            
            let x = sin(angle) * radius // == opposite
            let y = cos(angle) * radius // == adj
            
            orbLayer.position = CGPoint(x: self.view.center.x + x, y: self.view.center.y + y)
            
            layers.append(orbLayer)
        }
        
        
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "sequencer:", userInfo: nil, repeats: true)
        
    }
    
    func sequencer(sender: AnyObject?) {
        
        let topLayer = layers.removeAtIndex(0)
        
        throbLayerOnce(topLayer)
        
        layers.append(topLayer)
        
        // play a beat?
    }
    
    
    func throbLayerOnce(layer: CALayer) {
        
        let throb = CABasicAnimation(keyPath: "transform.scale")
        
        throb.byValue = 0.5
        throb.autoreverses = true
        throb.repeatCount = 0
        throb.duration = 0.3
        
        layer.addAnimation(throb, forKey: "throb")
    
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

