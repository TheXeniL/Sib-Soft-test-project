//
//  AppDelegate.swift
//  sib-soft task
//
//  Created by Никита Елизаров on 09/05/2017.
//  Copyright © 2017 Никита Елизаров. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
      
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    
    }
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        let defaults = UserDefaults.standard
        defaults.set(Data.ImageCollection, forKey: "imageCollectionKey")
        defaults.synchronize()
        
    }
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        let defaults = UserDefaults.standard
        let defaultValue = ["imageCollectionKey" : ""]
        defaults.register(defaults: defaultValue)
    }
    
}

