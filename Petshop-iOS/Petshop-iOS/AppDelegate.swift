//
//  AppDelegate.swift
//  Petshop-iOS
//
//  Created by Matheus Ferreira on 10/02/24.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        
        let loginViewController = LoginViewController()
      
        window?.rootViewController = loginViewController
        
        window?.makeKeyAndVisible()
        
        return true
    }
}
