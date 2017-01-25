//
//  CTCDevice.swift
//  CocoaTruConnect
//
//  Created by Hal Mueller on 1/22/17.
//  Copyright © 2017 Hal Mueller. All rights reserved.
//

import CoreFoundation
import CoreBluetooth

public protocol CTCSerialDeviceDelegate {
	func device(_ device: CTCSerialDevice, didReceiveString string: String)
}

public class CTCSerialDevice: NSObject, CBPeripheralDelegate {
	public var delegate: CTCSerialDeviceDelegate?
	public var name: String?
	public var identifier: UUID?
	
	public func send(string: String) {
		print(#function, string)
	}

	var peripheral: CBPeripheral?

	// MARK: - CBPeripheralDelegate
	public func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
		print(#function)

	}

}
