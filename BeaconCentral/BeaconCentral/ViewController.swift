//
//  ViewController.swift
//  BeaconCentral
//
//  Created by Cory Alder on 2015-07-31.
//  Copyright (c) 2015 Cory Alder. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate {
    

    @IBOutlet weak var statusLabel: UILabel!
    
    
    let beaconRegion = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "15F73C06-7F62-4DEC-9979-2D26A74B0668"), identifier: "com.lighthouse.beacon")
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        
//        locationManager.startMonitoringForRegion(beaconRegion)
        locationManager.startRangingBeaconsInRegion(beaconRegion)
    }
    
    func locationManager(manager: CLLocationManager!, didEnterRegion region: CLRegion!) {
        locationManager.startRangingBeaconsInRegion(beaconRegion)
    }
    
    func locationManager(manager: CLLocationManager!, didExitRegion region: CLRegion!) {
        locationManager.stopRangingBeaconsInRegion(beaconRegion)
    }
    
    
    func locationManager(manager: CLLocationManager!, didRangeBeacons beacons: [AnyObject]!, inRegion region: CLBeaconRegion!) {
        
        if let beacon = beacons.first as? CLBeacon {
            
            
            switch beacon.proximity {
            case .Near:
                statusLabel.text = "Near"
            case .Far:
                statusLabel.text = "Far"
            case .Unknown:
                statusLabel.text = "Whereever you are"
            case .Immediate:
                statusLabel.text = "Immediate"
            }
            
            
        } else {
            statusLabel.text = "No beacons found"
            println("no beacons found")
        }
        
        
    }

}

