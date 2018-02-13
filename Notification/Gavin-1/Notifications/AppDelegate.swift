//
//  AppDelegate.swift
//  Notifications
//
//  Created by PinguMac on 2018/2/12.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    self.window?.rootViewController = setTabBar()
    
    return true
  }
  
  func setTabBar() -> UITabBarController {
    let tabBarCtrl = UITabBarController()
    
    let homeVC = ViewController()
    let subVC1 = subViewController1()
    let subVC2 = subViewController2()
    let subVC3 = subViewController3()
    
    subVC1.delegate = homeVC
    subVC2.delegate = homeVC
    subVC3.delegate = homeVC
  
    tabBarCtrl.viewControllers = [homeVC, subVC1, subVC2, subVC3]
    
    let firstTab = tabBarCtrl.tabBar.items![0]
    firstTab.image = UIImage(named: "home")?.withRenderingMode(.alwaysOriginal)
    
    let secondTab = tabBarCtrl.tabBar.items![1]
    secondTab.image = UIImage(named: "sword")?.withRenderingMode(.alwaysOriginal)

    let thirdTab = tabBarCtrl.tabBar.items![2]
    thirdTab.image = UIImage(named: "shield")?.withRenderingMode(.alwaysOriginal)
    
    let fourth = tabBarCtrl.tabBar.items![3]
    fourth.image = UIImage(named: "magic")?.withRenderingMode(.alwaysOriginal)
    
    return tabBarCtrl
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

