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
	var txChar: CBCharacteristic?
	var rxChar: CBCharacteristic?
	var configChar: CBCharacteristic?
	
	public func send(string: String) {
		print(#function, string)
	}

	var peripheral: CBPeripheral?

	// MARK: - CBPeripheralDelegate
	public func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
		print(#function)

	}

	public func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
		print(#function, peripheral.services)
		if let services = peripheral.services {
			for service in services {
				print(service)
				peripheral.discoverCharacteristics(nil, for: service)
			}
		}
	}

	public func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
		print(#function, service, service.characteristics)
		if let characteristics = service.characteristics {
			for characteristic in characteristics {
				print(characteristic.uuid)
				if characteristic.uuid == truconnectPeripheralModeCharacteristicUUID {
					configChar = characteristic
				}
				else if characteristic.uuid == truconnectPeripheralTXCharacteristicUUID {
					txChar = characteristic
				}
				else if characteristic.uuid == truconnectPeripheralRXCharacteristicUUID {
					rxChar = characteristic
				}
			}
		}
	}

}
