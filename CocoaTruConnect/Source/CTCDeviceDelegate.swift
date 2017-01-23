//
//  CTCDeviceDelegate.swift
//  Mac Sample
//
//  Created by Hal Mueller on 1/22/17.
//  Copyright © 2017 Hal Mueller. All rights reserved.
//

protocol CTCDeviceDelegate {
	func device(_ device: CTCDevice, didReceiveString string: String)
}
