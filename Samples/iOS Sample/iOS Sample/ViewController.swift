//
//  ViewController.swift
//  iOS Sample
//
//  Created by Hal Mueller on 1/24/17.
//  Copyright © 2017 Hal Mueller. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	var serialDeviceManager = CTCManager()

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	@IBAction func startScanning(_ sender: Any) {
		serialDeviceManager.startScanning()
	}
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

