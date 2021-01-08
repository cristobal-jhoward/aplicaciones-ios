//
//  AppDelegate.swift
//  Hola Chuck
//
//  Created by master on 08/01/2021.
//  Copyright © 2021 master. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        let viewController = ViewController()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = viewController
        
        //window?.rootViewController?.view.backgroundColor = .blue
        
        window?.makeKeyAndVisible()
        
        return true
    }

    // MARK: UISceneSession Lifecycle




}

