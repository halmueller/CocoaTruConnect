//
//  CTCManagerDelegate.swift
//  Mac Sample
//
//  Created by Hal Mueller on 1/22/17.
//  Copyright © 2017 Hal Mueller. All rights reserved.
//

protocol CTCManagerDelegate {
	func manager(_ manager: CTCManager, didDiscoverDevice device: CTCDevice)
}
