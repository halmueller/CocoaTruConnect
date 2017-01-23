//
//  CTCManager.swift
//  CocoaTruConnect
//
//  Created by Hal Mueller on 1/22/17.
//  Copyright © 2017 Hal Mueller. All rights reserved.
//

import CoreFoundation
import CoreBluetooth

// from http://truconnect.ack.me/2.0/ble_connections

let SERVICE_TRUCONNECT_UUID_STRING = "175f8f23-a570-49bd-9627-815a6a27de2a"

// Strings sent to TruConnect serial interface
let CHARACTERISTIC_TRUCONNECT_PERIPHERAL_RX_UUID_STRING = "1cce1ea8-bd34-4813-a00a-c76e028fadcb"

// Strings received from TruConnect serial interface
let CHARACTERISTIC_TRUCONNECT_PERIPHERAL_TX_UUID_STRING = "cacc07ff-ffff-4c48-8fae-a9ef71b75e26"

// 1 (STREAM_MODE), 2 (LOCAL_COMMAND_MODE), 3 (REMOTE_COMMAND_MODE)
let CHARACTERISTIC_TRUCONNECT_MODE_UUID_STRING =          "20b9794f-da1a-4d14-8014-a0fb9cefb2f7"

let truconnectServiceUUID = CBUUID(string: SERVICE_TRUCONNECT_UUID_STRING)
let truconnectPeripheralRXCharacteristicUUID =   CBUUID(string: CHARACTERISTIC_TRUCONNECT_PERIPHERAL_RX_UUID_STRING)
let truconnectPeripheralTXCharacteristicUUID =   CBUUID(string: CHARACTERISTIC_TRUCONNECT_PERIPHERAL_TX_UUID_STRING)
let truconnectPeripheralModeCharacteristicUUID = CBUUID(string: CHARACTERISTIC_TRUCONNECT_MODE_UUID_STRING)

// standard services
// source: https://www.bluetooth.com/specifications/gatt/viewer?attributeXmlFile=org.bluetooth.service.device_information.xml
let batteryServiceUUID =                 CBUUID(string: "180F")
let batteryLevelCharacteristicUUID =     CBUUID(string: "2A19")
let deviceInformationServiceUUID =       CBUUID(string: "180A")
let manufacturerNameCharacteristicUUID = CBUUID(string: "2A29")
let modelNumberCharacteristicUUID =      CBUUID(string: "2A24")
let serialNumberCharacteristicUUID =     CBUUID(string: "2A25")
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
