//
//  AppDelegate.swift
//  nearby
//
//  Created by Burak Kaya on 08.01.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let bounds = UIScreen.main.bounds
        window = UIWindow(frame: bounds)
        window?.makeKeyAndVisible()
        AppRouter.shared.startApp()
        return true
    }

}

