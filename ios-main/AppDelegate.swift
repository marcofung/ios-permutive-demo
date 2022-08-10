//
//  AppDelegate.swift
//  ios-main
//
//  Created by Marco on 26/4/2019.
//  Copyright © 2019 Marco. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        PermutiveManager.startSDK()
		return true
	}

}
