//
//  AppDelegate.swift
//  Photos
//
//  Created by Decheng Ma on 14/09/2019.
//  Copyright © 2019 Decheng Ma. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - Properties
    
    var window: UIWindow?
    
    // MARK: -
    
    private let appCoordinator = AppCoordinator()
    
    // MARK: - Application Life Cycle
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Initialize Window
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // Configure Window
        window?.rootViewController = appCoordinator.rootViewController
        
        // Make Key and Visible
        window?.makeKeyAndVisible()
        
        // Start Coordinator
        appCoordinator.start()
        
        return true
    }
    
}
