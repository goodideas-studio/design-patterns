//
//  AppDelegate.swift
//  Notification-1
//
//  Created by Sonny on 2018/2/12.
//  Copyright © 2018年 SonnyCompany. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow(frame:UIScreen.main.bounds)
        self.window!.backgroundColor = UIColor.black
        let myTabBar = UITabBarController()
        myTabBar.tabBar.backgroundColor = UIColor.yellow
        
        
        
        let mainViewController = ViewController()
        mainViewController.tabBarItem = UITabBarItem(title:"MAIN", image: UIImage(named:""), tag: 500)
        
        let gameBoard1ViewController = GameBoard1ViewController()
        gameBoard1ViewController.tabBarItem = UITabBarItem(title:"gb1", image: UIImage(named:""), tag: 501)
        
        let gameBoard2ViewController = GameBoard2ViewController()
        gameBoard2ViewController.tabBarItem = UITabBarItem(title: "gb2", image: UIImage(named:""), tag: 502)
        
        let gameBoard3ViewController = GameBoard3ViewController(nibName: nil, bundle: nil)
        gameBoard3ViewController.tabBarItem = UITabBarItem(title: "gb3", image: UIImage(named:""), tag: 503)
        
        myTabBar.viewControllers = [mainViewController,gameBoard1ViewController,gameBoard2ViewController,gameBoard3ViewController]
        
        myTabBar.selectedIndex = 0
        self.window!.rootViewController = myTabBar
        self.window!.makeKeyAndVisible()
        
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

