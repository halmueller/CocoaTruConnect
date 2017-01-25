//
//  CTCDevice.swift
//  CocoaTruConnect
//
//  Created by Hal Mueller on 1/22/17.
//  Copyright © 2017 Hal Mueller. All rights reserved.
//

import CoreFoundation
import CoreBluetooth

public protocol CTCDeviceDelegate {
	func device(_ device: CTCDevice, didReceiveString string: String)
}

public class CTCDevice: NSObject, CBPeripheralDelegate {
	var delegate: CTCDeviceDelegate?

	public func send(string: String) {
		print(#function, string)
	}

	// MARK: - CBPeripheralDelegate
	public func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
		print(#function)

	}

}
