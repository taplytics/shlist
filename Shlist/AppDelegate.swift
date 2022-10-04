//
//  AppDelegate.swift
//  Shlist
//
//  Created by Pavel Lyskov on 09.04.2020.
//  Copyright © 2020 Pavel Lyskov. All rights reserved.
//

import Storez
import UIKit
import Taplytics


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // Override point for customization after application launch.

        configureUIAppearance()
        
        let qaoptions: [String:Any] = [
//            TaplyticsOptionShowLaunchImage: false,
//            TaplyticsOptionShowShakeMenu: true,
//            TaplyticsOptionDisableBorders: false,
            TaplyticsOptionDelayLoad: 10,
//            TaplyticsOptionNewAdobeFormat: true,
//            TaplyticsOptionSkipViewControllers: [String(describing: ViewControllerMainScreen.self)],
//            "server": "staging-upcoming",
//            TaplyticsOptionPushSandbox: 1,
//            TaplyticsOptionLogging: true,
//            TaplyticsOptionLogLevel: 1,
//            "tlLogging": true,
//            "liveUpdate": true,
//            TaplyticsOptionFastMode: false,
//            TaplyticsOptionUserBucketing: true,
//            "delayResponse": 8
        ]
        
        Taplytics.startAPIKey("<TL_SDK_KEY>", options: qaoptions)
 
        return true
    }

    func configureUIAppearance() {
        let appearance = UINavigationBar.appearance()
        let titleTextAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.label
        ]

        appearance.tintColor = .label
        appearance.prefersLargeTitles = true
        appearance.isTranslucent = true
        appearance.titleTextAttributes = titleTextAttributes
        appearance.largeTitleTextAttributes = titleTextAttributes
    }

    // MARK: UISceneSession Lifecycle

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(
            name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(
        _ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>
    ) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }
    
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        let items = Settings.Store.loadItems(from: url)
        
        Settings.Store.productsRepo.set(items: items)
        
        return true
    }


}
