//
//  AppDelegate.swift
//  SparkXAdDemo-Swift
//
//  Created by Wei yang on 2021/3/16.
//

import UIKit
import AppTrackingTransparency

@main
class AppDelegate: UIResponder, UIApplicationDelegate,YieldzoneAdSplashAdDelegate {

    private var _splash:YieldzoneAdSplashAd?;
   public var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { (status:ATTrackingManager.AuthorizationStatus) in
                YieldzoneAdApi.initWithYieldzoneAd("546FF24D-08C6-91AB-FF0F-9C930521E406") { Error in
                    
                }
            }
        } else {
            // Fallback on earlier versions
            YieldzoneAdApi.initWithYieldzoneAd("546FF24D-08C6-91AB-FF0F-9C930521E406") { Error in
                
            }
        }
        YieldzoneAdApi.setLogEnabled(true)
        YieldzoneAdApi .setAdvertiserTrackingEnabled(true)
        
        let rootVC = AdListViewController()
        let nav = UINavigationController.init(rootViewController: rootVC)
        window = UIWindow.init(frame: UIScreen.main.bounds)
        
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        _splash = YieldzoneAdSplashAd.init(placementId: "546FF24D-08C6-91AB-FF0F-9C930521E406-3")
        _splash?.delegate = self
        _splash?.show(fromRootViewController:(window?.rootViewController)!,  withBottomView: nil)

        
        return true
    }


}

