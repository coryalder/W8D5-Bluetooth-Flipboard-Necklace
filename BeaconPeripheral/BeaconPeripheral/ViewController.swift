//
//  ViewController.swift
//  BeaconPeripheral
//
//  Created by Cory Alder on 2015-07-31.
//  Copyright (c) 2015 Cory Alder. All rights reserved.
//

import UIKit
import CoreBluetooth
import CoreLocation

class ViewController: UIViewController, CBPeripheralManagerDelegate {
    
    let beaconRegion = CLBeaconRegion(proximityUUID: NSUUID(UUIDString: "15F73C06-7F62-4DEC-9979-2D26A74B0668"), major: 1, minor: 1, identifier: "com.lighthouse.beacon")

    var peripheralManager: CBPeripheralManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        peripheralManager = CBPeripheralManager(delegate: self, queue: nil)
        
    
    }

    func peripheralManagerDidUpdateState(peripheral: CBPeripheralManager!) {
        switch peripheral.state {
        case .PoweredOn:
            // start advertising
            peripheral.startAdvertising(beaconRegion.peripheralDataWithMeasuredPower(0) as [NSObject : AnyObject])
            
        case .PoweredOff:
            peripheral.stopAdvertising()
            // stop advertising
        case .Unauthorized, .Unknown, .Unsupported, .Resetting:
            println("danger!")
        }
    }


}

