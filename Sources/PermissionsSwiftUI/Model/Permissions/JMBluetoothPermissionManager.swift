//
//  JMBluetoothPermissionManager.swift
//  
//
//  Created by Jevon Mao on 1/31/21.
//

import UIKit
import CoreBluetooth

class JMBluetoothPermissionManager: NSObject {
    
    typealias JMBluetoothPermissionHandler = (Bool)->()?
    private var completion: JMBluetoothPermissionHandler?
    private var manager: CBCentralManager?
    static let shared = JMCalendarPermissionManager()

    func requestPermission(completion: @escaping (Bool)->()?) {
        self.completion = completion
        self.manager = CBCentralManager(delegate: self, queue: nil, options: [:])
    }
}

extension JMBluetoothPermissionManager: CBCentralManagerDelegate {
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
            switch central.authorization {
            case .notDetermined:
                break
            case .allowedAlways:
                self.completion?(true)
            default:
                self.completion?(false)
            }
  
    }
    
}
