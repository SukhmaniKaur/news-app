//
//  AppDelegate.swift
//  NewApp
//
//  Created by MACBOOK on 15/11/21.
//

import UIKit
import NVActivityIndicatorView

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var activityLoader : NVActivityIndicatorView!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}

extension AppDelegate {
    func sharedDelegate() -> AppDelegate
    {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    func showLoader()
    {
        removeLoader()
        DispatchQueue.main.async { [self] in
            self.window?.isUserInteractionEnabled = false
            self.activityLoader = NVActivityIndicatorView(frame: CGRect(x: ((self.window?.frame.size.width)!-50)/2, y: ((self.window?.frame.size.height)!-50)/2, width: 50, height: 50))
            self.activityLoader.type = .ballSpinFadeLoader
            self.activityLoader.color = AppColors.LoaderColor
            self.window?.addSubview(self.activityLoader)
            self.activityLoader.startAnimating()
        }
    }
    
    func removeLoader()
    {
        DispatchQueue.main.async { [self] in
            self.window?.isUserInteractionEnabled = true
            if self.activityLoader == nil {
                return
            }
            self.activityLoader.stopAnimating()
            self.activityLoader.removeFromSuperview()
            self.activityLoader = nil
        }
    }
}
