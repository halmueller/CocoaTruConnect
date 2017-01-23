//
//  CTCManager.swift
//  CocoaTruConnect
//
//  Created by Hal Mueller on 1/22/17.
//  Copyright © 2017 Hal Mueller. All rights reserved.
//

import CoreFoundation
import CoreBluetooth

let FUEL_SENSOR_SERVICE_UUID_STRING =        "be14e552-dd6d-a586-ce42-c1d900006eca"
let FUEL_SENSOR_PULSE_COUNT_CHARACTERISTIC_UUID_STRING = "be14e553-dd6d-a586-ce42-c1d900006eca"
let fuelSensorServiceUUID = CBUUID(string: FUEL_SENSOR_SERVICE_UUID_STRING)
let fuelSensorPulseCountCharacteristicUUID = CBUUID(string: FUEL_SENSOR_PULSE_COUNT_CHARACTERISTIC_UUID_STRING)

let BATTERY_SERVICE_UUID_STRING = "180F"
let BATTERY_LEVEL_CHARACTERISTIC_UUID_STRING = "2A19"
let batteryServiceUUID = CBUUID(string: BATTERY_SERVICE_UUID_STRING)
let batteryLevelCharacteristicUUID = CBUUID(string: BATTERY_LEVEL_CHARACTERISTIC_UUID_STRING)

// source: https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.service.device_information.xml

let deviceInformationServiceUUID = CBUUID(string: "180A")
let manufacturerNameCharacteristicUUID = CBUUID(string: "2A29")
let modelNumberCharacteristicUUID = CBUUID(string: "2A24")
let serialNumberCharacteristicUUID = CBUUID(string: "2A25")
let hardwareRevisionCharacteristicUUID = CBUUID(string: "2A27")
let softwareRevisionCharacteristicUUID = CBUUID(string: "2A28")

class CTCManager: NSObject, CBCentralManagerDelegate {

	func centralManagerDidUpdateState(_ central: CBCentralManager) {
	}

	func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
	}
	func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
	}
	func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
	}
	func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {

	}
}
