//
//  AppDelegate.swift
//  HexConverter
//
//  Created by lip on 17/1/7.
//  Copyright © 2017年 lip. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
//        let vc = HexConvertViewController()
        let vc = TestViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
        return true
    }




}

