//
//  AppDelegate.swift
//  Places
//
//  Created by Willian Fagner De Souza Policiano on 13/07/20.
//  Copyright © 2020 Willian. All rights reserved.
//

import UIKit
import Presentation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootViewController = HomeConfigurator().resolve()

        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()

        return true
    }
}

